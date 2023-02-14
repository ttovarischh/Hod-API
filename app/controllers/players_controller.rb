class PlayersController < ApplicationController
    def create
		@game = Game.find_by_slug(params[:code])
		@player = @game.players.create(params[:player].permit(:name, :hp, :initiative, :languages, :perc, :inv, :ins, :armor, :conc))
		redirect_to game_path(@game)
	end
	def index
		@player = @game.players.create(params[:player].permit(:name, :hp, :initiative, :languages, :perc, :inv, :ins, :armor, :conc))
		render json: @player
	end
end
