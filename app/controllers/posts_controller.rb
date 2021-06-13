class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit]
  def index
    @posts = Post.all
  end
  def new
    @post = Post.new
  end
  def confirm
    @post = Post.new(post_params)
    render :new if @post.invalid?
  end
  def create
    @post = Post.new(post_params)
    if params[:back]
      render:new
    else
      if @post.save
        redirect_to posts_path, notice: "投稿しました"
      else
        render :new
      end
    end
  end
  def show
  end
  def edit
  end
  private
  def post_params
    params.permit(:image, :image_cache)
  end
  def set_post
    @post = Post.find(params[:id])
  end
end
