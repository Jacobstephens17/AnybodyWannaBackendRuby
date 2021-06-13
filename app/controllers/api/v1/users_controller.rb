
module Api
  module V1
      class UsersController < ApplicationController
        def index
          users = User.all
          UserSerializer.new(users).serialized_json
          render json: UserSerializer.new(users).serialized_json
        end


        def show 
          user = User.find_by(slug: params[:slug])
          render json: UserSerializer.new(user).serialized_json
        end

        

        def create
          user = User.new(user_params)
          if user.save
            render json: UserSerializer.new(user).serialized_json
          else
            render json: {error: user.error.messages }, status:422
          end
        end


        def update
          user = User.find_by(slug: params[:slug])
          if user.update(user_params)
            render json: UserSerializer.new(user).serialized_json
          else
            render json: {error: user.error.messages }, status:422
          end
        end

        def destroy
          user = User.find_by(slug: params[:slug])
          if user.destroy
            head :no_content
          else
            render json: {error: user.error.messages }, status:422
          end
        end



        private

        def user_params
          params.require(:user).permit(:username, :password)
        end


      end
    end
  end
