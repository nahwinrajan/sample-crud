class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :delete]

  #show all post
  def index
    @posts = Post.all.order("created_at DESC")
  end

  #create new post
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:success] = "Published your post into the internet"
      redirect_to @post
    else
      flash[:alert] = "Post not saved!!"
      #render does not exec any code in target action
      #therefor the form will not lost value user key-ed in
      render 'new'
    end
  end

  #edit post
  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  #remove post
  def delete
  end

  #show selected post
  def show
  end

  private
    def post_params
      params.require(:post).permit(:title, :subtitle, :content)
    end

    def find_post
      @post = Post.find_by_id(params[:id])
      if @post.nil?
        #avoid round trip (from index - search, not found - index)
        @post = Post.all.order("created_at DESC")
        flash.now[:alert] = "the post you are looking for is not found."
        render :index
      end
    end
end
