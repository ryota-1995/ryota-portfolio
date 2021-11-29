class UsersController < ApplicationController
  def new
  end

  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to("lives/index")
    else
      @email = params[:email]
      @password = params[:password]
      render("users/login")
    end
  end

  def index
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
    )
    if @user.save
      session[:user_id] = @user.id
      #flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/create")
    end
  end

  def update
  end
end
