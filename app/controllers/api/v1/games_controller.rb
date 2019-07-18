class Api::V1::GamesController < ApplicationController

    def index 
        @games = Games.all
        render json: @games, status: :ok
    end 

    def show 
        @game = Game.find_all(params[:id])
        render json: @game, status: :ok
    end 

    def create
        @game = Game.new(game_params)
        if @game.save 
            render json: @game, status: :created
        else
            render json: {errors: @game.errors.full_messages}, status: :unprocessable_entity
        end 
    end 

    def update
        @game.update(params[:id])
        if @game.save 
            render json: @game, status: :accepted
        else 
            render json: { errors: @game.errors.full_messages }, status: :unprocessable_entity 
        end 
    end 

    def delete
        @game = Game.find(params[:id])
        @game.destroy
        render json: {}, status: :no_content
    end 

    private 

    def game_params 
        params.require(:game).permit(:name, :img_url)
    end 

end
