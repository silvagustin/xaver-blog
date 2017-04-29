class PostsController < ApplicationController
  #before_action :get_post, only: [ :show, :edit, :update, :destroy ]

  protect_from_forgery prepend: true
  before_action :authenticate_usuario!, except: [ :index, :show ]

  load_and_authorize_resource
  skip_authorize_resource :only => :show

  def show
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    #@post = Post.new(post_params)
    @post = current_usuario.posts.build(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    authorize! :read, @post
  end

  def update
    authorize! :read, @post
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    
    redirect_to posts_path
  end


  private

    def post_params
      params.required(:post).permit(:titulo, :descripcion, :contenido)
    end

    #def get_post
    #  @post = Post.find(params[:id])
    #end
end
