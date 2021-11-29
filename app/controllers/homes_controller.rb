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
    @post = Post.new(content: params[:content])
    @post.save
    redirect_to("/homes/index")
  end

  def search
    if params[:name].present?
      @lives = Live.where("title LIKE ? OR place LIKE ?", "%#{params[:name]}%", "%#{params[:name]}%")
    else
      @lives = Live.none
    end
  end
end
