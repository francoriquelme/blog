class PostsController < ApplicationController
    before_action :set_post, only: %i[ show edit update destroy ]
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
        @post = Post.new(post_params)
        respond_to do |format|
          if @post.save
            format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
            format.json { render :show, status: :created, location: @post }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @post.errors, status: :unprocessable_entity }
          end
        end
    end
    def update
        if @post.update(params)
            redirect_to @post, notice: "Post was successfully updated."
        else
            render :edit, status: :unprocessable_entity
        end
    end
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_url, notice: "Post was successfully destroyed."
    end
    private
        # Use callbacks to share common setup or constraints between actions.
        def set_post
            @post = Post.find(params[:id])
        end
        # Only allow a list of trusted parameters through.
        def post_params
            params.require(:post).permit(:title, :description, :author)
        end
end