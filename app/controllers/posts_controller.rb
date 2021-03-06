class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.create(title: params[:post][:title], description: params[:post][:description])
	  redirect_to post_path(@post)
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
	  @post = Post.find(params[:id])
	  @post.update(params.require(:post).permit(:title, :description))
	  redirect_to post_path(@post)
	end

	private
		def post_params
			params.require(:post).permit(:title, :description)
		end
end