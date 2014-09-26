class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users/add.json
  def add
    user = params[:user]
    password = params[:password]
    code = User.add(user, password)
    if code == 1
      countuser = User.find_by(user: user)
      count = countuser[:count]
      json = { "count" => count, "errCode" => 1}
      render json: json
    else
      json = { "errCode" => code }
      render json: json
    end
  end

  # POST /users/login.json
  def login
    user = params[:user]
    password = params[:password]
    login_user = User.find_by(user: user)
    if login_user.nil?
      json = { "errCode" => -1 }
      render json: json
    else
      if login_user[:password] != password
        json = { "errCode" => -1 }
        render json: json
      else
        User.login(user, password)
        count = User.find_by(user: user)
        count = count[:count]
        json = { "count" => count, "errCode" => 1 }
        render json: json
      end
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:user, :password)
    end
end
