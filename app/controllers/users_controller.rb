class UsersController < ApplicationController
  #"ActionController::InvalidAuthenticityToken" というエラーが出るのでloginアクション時のみCSRF保護を無効に
  protect_from_forgery except: :login

  def index
  end

  def new
  end

  #loginのpostで送られる
  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      #ブラウザの持つsessionというファイルの:nameキーに値が入る。
      session[:user_id] = @user.id
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
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/")
    else
      @error_message = "別の値を入力してください"
      @email = params[:email]
      @password = params[:password]
      render("users/new")
    end
  end

  def update
  end

  #loginのgetで送られる
  def login_form
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
  end
end
