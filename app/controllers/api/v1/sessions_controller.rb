class Api::V1::SessionsController < ApplicationController

    def create 
        @user = User.find_by(username: params[:username])
        
        if @user && @user.authenticate(params[:password])
            # byebug
           @token = JWT.encode({ user_id: @user.id }, "mr_robot", 'HS256')
           render json: { token: @token, user: @user}, status: :ok
        else
            render json: { errors: "Incorrect username or password" },
                   status: :unauthorized
        end 
    end 
end 

