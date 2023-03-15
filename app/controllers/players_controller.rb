class PlayersController < ApplicationController
    before_action :set_game
  
    # POST /api/v1/games/AB123/players
    def create
      @player = @game.players.new(player_params)
      if @player.save
        render json: @player,
               status: :created 
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

    # GET /effects/1 or /effects/1.json
    def show
        @player = Player.find(params[:id])
        render json: @player
    end

    # PATCH/PUT /api/v1/players/1
    def update
        @player = Player.find(params[:id])
        if @player.update(player_params)
            render json: @player
        else
            render json: @player.errors, status: :unprocessable_entity
        end
    end
  
    private
    def set_game
      @game = Game.find_by_code!(params[:game_id])
    end
  
    def player_params
      params.require(:player)
            .permit(
               :name, :hp, :initiative, :language, 
               :perc, :inv, :ins, :armor, :conc,
               :username, :imagestring, :id
            )
    end
  end
