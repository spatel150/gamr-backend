class Api::V1::UsersController < ApplicationController

    before_action :authorize!, only: [:create]

    def index 
        @users = Users.all
        render json: @users, status: :ok
    end 

    def show 
        @user = User.find_all(params[:id])
        render json: @user, status: :ok
    end 

    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user, status: :created
        else
            render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
        end 
    end 

    def update
        @user.update(user_params)
        if @user.save 
            render json: @user, status: :accepted
        else 
            render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity 
        end 
    end 

    def delete
        @user = User.find(params[:id])
        @user.destroy
        render json: {}, status: :no_content
    end 

    private 

    def user_params
        params.require(:user).permit(:username, :password, :name)
    end 

end
