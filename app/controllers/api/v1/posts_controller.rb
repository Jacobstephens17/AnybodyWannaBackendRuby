
module Api
  module V1
      class PostsController < ApplicationController
        def index
          posts = Post.all
          PostSerializer.new(posts).serialized_json
          render json: PostSerializer.new(posts).serialized_json
        end


        def show 
          post = Post.find_by(slug: params[:slug])
          render json: PostSerializer.new(post).serialized_json
        end

        

        def create
          post = Post.new(post_params)
          if post.save
            render json: PostSerializer.new(post).serialized_json
          else
            render json: {error: post.error.messages }, status:422
          end
        end


        def update
          post = Post.find_by(slug: params[:slug])
          if post.update(post_params)
            render json: PostSerializer.new(post).serialized_json
          else
            render json: {error: post.error.messages }, status:422
          end
        end

        def destroy
          post = Post.find_by(slug: params[:slug])
          if post.destroy
            head :no_content
          else
            render json: {error: post.error.messages }, status:422
          end
        end



        private

        def post_params
          params.require(:post).permit(:title, :description, :location, :group)
        end


      end
    end
  end
