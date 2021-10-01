class GamesController < ApplicationController
    def index
        @games = Game.all
    end

    def show
        @game = Game.find(params[:id])
    end

    def new
        @game = Game.new
    end

    def create
        @platform = Platform.find(params[:platform_id])
        @game = @platform.games.bulid(game_params)

        if @game.save
            redirect_to games_path
        else
            render :new
        end
    end

    def edit
        @game = Game.find(params[:id])
    end

    def update
        @game = Game.find(params[:id])

        if @game.update(game_params)
            redirect_to games_path
        else
            render :new
        end
    end

    def destroy
        @game = Game.find(params[:id])
        @game.destroy

        redirect_to root_path
    end
    
    private
        def game_params
            params.require(:game).permit(:name, :price, :description)
        end
end
