class PostsController < ApplicationController

  before_action :find_post, only:[:show, :update, :edit, :destroy]

  def index

    @posts = Post.all.order("created_at DESC")
  end




  def new
    @post = Post.new
  end


  def create
    @post = Post.new(post_param)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end 
  end


  def show
    
  end


  def edit
    

  end


  def update
    

    if @post.update(post_param)
      redirect_to @post
    else
      render 'edit'
    end
  end


  def destroy
    @post.destroy
    redirect_to root_path
  end


  private

  def find_post
    @post = Post.find(params[:id])

  end

  def post_param
    params.require(:post).permit(:title, :body)

  end

end
