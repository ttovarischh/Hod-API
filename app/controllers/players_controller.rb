class PlayersController < ApplicationController
    before_action :set_game
  
    # POST /api/v1/games/AB123/players
    # def create
    #   @player = @game.players.new(player_params)
    #   if @player.save
    #     ActionCable.server.broadcast('PlayersChannel', {
    #       id: @player.id,
    #       name: @player.name,
    #       game_code: @game.code
    #     })
    #     render json: @player,
    #            status: :created 
    #   else
    #     render json: { errors: @player.errors.full_messages },
    #            status: :unprocessable_entity
    #   end
    # end

    def create
      @player = @game.players.new(player_params)
      if @player.save
        puts "Broadcasting player with game code: #{@game_code}"
        ActionCable.server.broadcast('PlayersChannel', {
          id: @player.id,
          name: @player.name,
          game_code: @game.code
        })
        render json: @player, status: :created
      else
        render json: { errors: @player.errors.full_messages }, status: :unprocessable_entity
      end
    end

    # def create
    #   message = Message.new(message_params)
    #   conversation = Conversation.find(message_params[:conversation_id])
    #   if message.save
    #     serialized_data = ActiveModelSerializers::Adapter::Json.new(
    #       MessageSerializer.new(message)
    #     ).serializable_hash
    #     MessagesChannel.broadcast_to conversation, serialized_data
    #     head :ok
    #   end
    # end
  
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
