class UsersController < ApplicationController
  #"ActionController::InvalidAuthenticityToken" というエラーが出るのでCSRF保護を無効に
  protect_from_forgery with: :null_session

  def index
  end

  def new
  end

  #loginのpostで送られる
  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      #ブラウザの持つsessionというファイルの:nameキーに値が入る。
      session[:name] = @user.name
      #flash[:notice]に値が入り、application.html.erbへ
      flash[:notice] = "ログインしました"
      redirect_to("/")
    else
      #@error_messageに値が入り、再度、login_form.html.erbへ
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
    )
    if @user.save
      session[:name] = @user.name
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/homes/index")
    else
      render("users/new")
    end
  end

  def update
  end

  #loginのgetで送られる
  def login_form
  end
end
