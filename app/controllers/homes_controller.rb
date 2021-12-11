class HomesController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
  end

  def create
    if session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      #アソシエーションを用いており、user_idが空だと保存されない。
      @post = Post.new(content: params[:content], user_id: @current_user.id)
      if @post.save
        flash[:notice] = "投稿しました。"
        redirect_to(root_path)
      else
        flash[:notice] = "フォームが空です。"
        redirect_to(root_path)
      end
    else
      flash[:notice] = "ログインしてください。"
      redirect_to(root_path)
    end
  end

  def search
    @result = params[:name]
    if @result.present?
      @lives = Live.where("title LIKE ? OR place LIKE ?", "%#{@result}%", "%#{@result}%")
      if @lives.empty?
        @error_message = "ごめんなさい。検索結果はありませんでした...。"
      end
    else
      flash[:notice] = "フォームが空です。"
      redirect_to(root_path)
    end
  end
end
