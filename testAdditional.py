import unittest
import os
import testLib

class TestIllegalSignup(testLib.RestTestCase):
    """ Test sending bad user creation requests """
    def assertResponse(self, respData, count = 1, errCode = testLib.RestTestCase.SUCCESS):
        """
        Check that response data dictionary matches expected values
        """
        expected = { 'errCode' : errCode }
        self.assertDictEqual(expected, respData)

    def testExistingUser(self):
        self.makeRequest("/users/add", method="POST", data = { 'user' : 'user', 'password' : 'password' } )
        respData = self.makeRequest("/users/add", method="POST", data = { 'user' : 'user', 'password' : 'password' } )
        self.assertResponse(respData, count = None, errCode = testLib.RestTestCase.ERR_USER_EXISTS)

    def testBlankUser(self):
        respData = self.makeRequest("/users/add", method="POST", data = { 'user' : '', 'password' : 'password' } )
        self.assertResponse(respData, count = None, errCode = testLib.RestTestCase.ERR_BAD_USERNAME)

class TestIllegalUser(testLib.RestTestCase):
    """ Test sending a login for an invalid user """
    def assertResponse(self, respData, count = 1, errCode = testLib.RestTestCase.ERR_BAD_CREDENTIALS):
        """
        Check that response data dictionary matches expected values
        """
        expected = { 'errCode' : errCode }
        self.assertDictEqual(expected, respData)

    def testBadLogin1(self):
        respData = self.makeRequest("/users/login", method="POST", data = { 'user' : 'notauser', 'password' : 'notapassword' } )
        self.assertResponse(respData, count = 1)

    def testBadLogin2(self):
        self.makeRequest("/users/add", method="POST", data = { 'user' : 'user', 'password' : 'password' } )
        respData = self.makeRequest("/users/login", method="POST", data = { 'user' : 'user', 'password' : 'notapassword' } )
        self.assertResponse(respData, count = 1)

class TestLegalUser(testLib.RestTestCase):
    """ Test sending a login for an invalid user """
    def assertResponse(self, respData, count = 1, errCode = testLib.RestTestCase.SUCCESS):
        """
        Check that response data dictionary matches expected values
        """
        expected = { 'errCode' : errCode }
        if count is not None:
            expected['count'] = count
        self.assertDictEqual(expected, respData)
    
    """ Test user creation """
    def testLogin1(self):
        self.makeRequest("/users/add", method="POST", data = { 'user' : 'user', 'password' : 'password' } )
        respData = self.makeRequest("/users/login", method="POST", data = { 'user' : 'user', 'password' : 'password' } )
        self.assertResponse(respData, count = 2)

    """ Test count increment """
    def testLogin2(self):
        self.makeRequest("/users/add", method="POST", data = { 'user' : 'user', 'password' : 'password' } )
        for x in range(0, 9):
            respData = self.makeRequest("/users/login", method="POST", data = { 'user' : 'user', 'password' : 'password' } )
        self.assertResponse(respData, count = 10)
