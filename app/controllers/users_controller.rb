class UsersController < ApplicationController

  # POST /users/add.json
  def add
    user = params[:user]
    password = params[:password]
    code = User.add(user, password)
    if code == 1
      countuser = User.find_by(user: user)
      count = countuser[:count]
      json = { "count" => count, "errCode" => 1}
      render status: 200, json: json
    else
      json = { "errCode" => code }
      render status: 200, json: json
    end
  end

  # POST /users/login.json
  def login
    user = params[:user]
    password = params[:password]
    login_user = User.find_by(user: user)
    if login_user.nil?
      json = { "errCode" => -1 }
      render status: 200, json: json
    else
      if login_user[:password] != password
        json = { "errCode" => -1 }
        render status: 200, json: json
      else
        User.login(user, password)
        count = User.find_by(user: user)
        count = count[:count]
        json = { "count" => count, "errCode" => 1 }
        render status: 200, json: json
      end
    end
  end

end
