class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    if @post.create(post_params)
      redirect_to @post
    else
      render 'new'
    end
  end


  private

    def post_params
      params.required.(:post).permit(:titulo, :descripcion, :contenido)
    end
end
