class MonstersController < ApplicationController
    def create
		@game = Game.find_by_slug(params[:code])
		@monster = @game.monsters.create(params[:monster].permit(:name, :hp, :initiative))
		redirect_to game_path(@game)
	end
end
