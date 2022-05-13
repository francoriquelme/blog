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
        @post = Post.new(params)
        if @post.save
            redirect_to @post, notice: "Post was successfully created."
        else
            render :new, status: :unprocessable_entity
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
end   
    