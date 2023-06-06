class MonstersController < ApplicationController
    before_action :set_game

	# GET /api/v1/games/AB123/monsters
    def index
        @monsters = @game.monsters
        render json: @monsters
    end
  
    # GET /effects/1 or /effects/1.json
    def show
        @monster = Monster.find(params[:id])
        render json: @monster.as_json(include: :effects), status: :ok
    end

	def create
		if @game.nil?
		  render json: { errors: "Game not found" }, status: :unprocessable_entity
		else
		  @monster = @game.monsters.new(monster_params)
		  if @monster.save
			ActionCable.server.broadcast('GamesChannel', @game.as_json(include: [{ players: { include: :effects } }, { monsters: { include: :effects } }]))
			render json: @monster, status: :created
		  else
			render json: { errors: @monster.errors.full_messages }, status: :unprocessable_entity
		  end
		end
	end

	def update
        @monster = Monster.find(params[:id])
        if @monster.update(monster_params)
			ActionCable.server.broadcast('GamesChannel', @game.as_json(include: [{ players: { include: :effects } }, { monsters: { include: :effects } }]))
            render json: @monster.as_json(include: :effects), status: :ok
        else
            render json: @monster.errors, status: :unprocessable_entity
        end
    end

	def add_effect
      monster = Monster.find(params[:id])
      effect = Effect.find(params[:effect_id])
      monster.effects << effect
      ActionCable.server.broadcast "MonsterEffectsChannel", { type: "ADD_EFFECT", payload: { monster_id: monster.id, effect: effect } }
      render json: monster, status: :ok
    end

    # DELETE /api/v1/games/AB123/monsters/1/effects
    def remove_effect
      @monster = Monster.find(params[:monster_id])
      @effect = @monster.effects.find(params[:effect_id])
      @monster.effects.delete(@effect)
      ActionCable.server.broadcast "MonsterEffectsChannel", { type: "REMOVE_EFFECT", payload: { monster_id: @monster.id, effect: @effect } }
      render json: { message: 'Effect deleted successfully' }
    end

    def effects
      @monster = Monster.find(params[:monster_id])
      effects = @monster.effects
      render json: effects
    end

	private
	def set_game
		@game = Game.find_by_code(params[:game_id])
		unless @game
		  render json: { error: "Game not found" }, status: :unprocessable_entity
		end
	end
  
    def monster_params
      params.require(:monster)
            .permit(
               :name, :initiative, :hp, :armor, :active, :conc
            )
    end
end
