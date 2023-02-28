class PlayersController < ApplicationController
	before_action :set_game # this method actually sets an instance variable
  
	# POST /api/v1/games/AB123/players
	def create
	  # Don't just assume that the user will pass valid input
	  @player = @game.players.new(player_params)
	  if @player.save
		render json: @player,
			   status: :created # pay attention to sending the correct status codes so the client knows what happened
	  else
		render json: { errors: @player.errors.full_messages },
			   status: :unprocessable_entity
	  end
	end
  
	# GET /api/v1/games/AB123/players
	def index
	  @players = @game.players
	  render json: @players
	end
  
	private
  
	# This method should use the "bang" method 
	# which will raise a exception and cause a 404 not found response if 
	# the game code is not valid 
	def set_game
	  @game = Game.find_by_code!(params[:game_id])
	end
  
	def player_params
	  params.require(:player)
			.permit(
			   :name, :hp, :initiative, :language, 
			   :perc, :inv, :ins, :armor, :conc
			)
	end
  end