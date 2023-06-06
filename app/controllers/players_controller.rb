class PlayersController < ApplicationController
    before_action :set_game

    # GET /api/v1/games/AB123/players
    def index
        @players = @game.players
        render json: @players
    end
  
    # GET /effects/1 or /effects/1.json
    def show
        @player = Player.find(params[:id])
        render json: @player.as_json(include: :effects), status: :ok
    end

    # DELETE /api/v1/games/AB123/players/1
    def destroy
      @player = Player.find(params[:id])
      @player.destroy
      render json: { message: 'Player deleted successfully' }
    end

    # POST /api/v1/games/AB123/players
    def create
      @player = @game.players.new(player_params)
      if @player.save
        puts "Broadcasting player with game code: #{@game_code}"
        ActionCable.server.broadcast('GamesChannel', @game.as_json(include: [{ players: { include: :effects } }, { monsters: { include: :effects } }]))
        render json: @player, status: :created
      else
        render json: { errors: @player.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def add_effect
      player = Player.find(params[:id])
      effect = Effect.find(params[:effect_id])
      player.effects << effect
      ActionCable.server.broadcast "PlayereffectsChannel", { type: "ADD_EFFECT", payload: { player_id: player.id, effect: effect } }
      render json: player, status: :ok
    end

    # DELETE /api/v1/games/AB123/players/1/effects
    def remove_effect
      @player = Player.find(params[:player_id])
      @effect = @player.effects.find(params[:effect_id])
      @player.effects.delete(@effect)
      ActionCable.server.broadcast "PlayereffectsChannel", { type: "REMOVE_EFFECT", payload: { player_id: @player.id, effect: @effect } }
      render json: { message: 'Effect deleted successfully' }
    end

    def effects
      @player = Player.find(params[:player_id])
      effects = @player.effects
      render json: effects
    end

    # PATCH/PUT /api/v1/players/1
    def update
      @player = Player.find(params[:id])
      if @player.update(player_params)
          ActionCable.server.broadcast('GamesChannel', @game.as_json(include: [{ players: { include: :effects } }, { monsters: { include: :effects } }]))
          render json: @player.as_json(include: :effects), status: :ok
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
               :username, :imagestring, :id, :active
            )
    end
  end
