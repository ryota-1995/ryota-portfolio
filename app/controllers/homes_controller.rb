class HomesController < ApplicationController
  impressionist :actions => [:show]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @live = Live.find_by(id: params[:id])
    impressionist(@live, nil, unique: [:session_hash])
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

  def today
    @time = Time.current
    @lives = Live.where(date: @time)
    @result = "本日のライブ情報"
    render "/homes/search"
  end

  def tomorrow
    @time = Time.current.tomorrow
    @lives = Live.where(date: @time)
    @result = "明日のライブ情報"
    render "/homes/search"
  end

  def next_saturday
    @time = Time.current.next_week(:saturday)
    @lives = Live.where(date: @time)
    @result = "次の土曜,#{@time.strftime("%-Y年%-m月%-d日")}"
    render "/homes/search"
  end

  def next_monday
    @time = Time.current.next_week(:monday)
    @lives = Live.where(date: @time)
    @result = "次の日曜,#{@time.strftime("%-Y年%-m月%-d日")}"
    render "/homes/search"
  end
end
