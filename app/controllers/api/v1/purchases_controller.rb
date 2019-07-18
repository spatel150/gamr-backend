class Api::V1::PurchasesController < ApplicationController

    def index
        @purchases = Purchase.all
        render json: @purchases, status: :ok
    end

    def show
        @purchase = Purchase.find(params[:id])
        render json: @purchase, status: :ok
    end
    
    def show_games
        # byebug
        # Give me game ids where username is equal to params: username

        @purchase = Purchase.where(username: params[:username])
        # puts params[:username]
        @purchase.each {|p| p.game_identifier}
        @purchase.map {|n| n.game_identifier}
        render json: @purchase, status: :ok
    end 

    def create
        # byebug
        @purchase = Purchase.new(purchase_params)
        # byebug
        # byebug
        if @purchase.save
            render json: @purchase, status: :created
        else
            render json: {errors: @purchase.errors.full_messages}, status: :unprocessable_entity
        end 
    end

    def update
        @purchase.update(purchase_params)
        if @purchase.save
            render json: @purchase, status: :accepted
        else 
            render json: { errors: @purchase.errors.full_messages }, status: :unprocessable_entity 
        end 
    end 

    def delete
        @purchase = Purchase.find(params[:id])
        @purchase.destroy
            render json: {}, status: :no_content
    end 

    private 

    def purchase_params 
        params.require(:purchase).permit(:price, :game_identifier, :username)
    end 

end
