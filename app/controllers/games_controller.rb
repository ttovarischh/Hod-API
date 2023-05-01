PREFACE      = ('A'..'Z').to_a << ?_
SUFFIX       = ('0'..'9').to_a
PREFACE_SIZE = 2
SUFFIX_SIZE  = 3

class GamesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :update]
  before_action :set_game, only: %i[ show edit update destroy ]
  respond_to :json

  # GET /games or /games.json
  def index
    @games = Game.all
    render json: @games, include: [:players, :monsters]
  end

  # GET /games/1 or /games/1.json
  def show
    @game = set_game
    render json: @game, include: [{ players: { include: :effects } }, { monsters: { include: :effects } }]
  end
      # @qr = RQRCode::QRCode.new(game_url)

  # GET /games/new
  def new
    @game = Game.new
  end

  def gen_name
    PREFACE.sample(PREFACE_SIZE).join << SUFFIX.sample(SUFFIX_SIZE).join
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games or /games.json
  def create
    @game = Game.new(game_params.merge(user_id: current_user.id))
    @game.code = gen_name

    logger.debug("@@@@ params: #{params}")

    if @game.save
      # broadcast an event using ActionCable
      ActionCable.server.broadcast('GamesChannel', {
        id: @game.id,
        name: @game.name
      })
      # return the game data as JSON
      render json: @game
    else
      render json: { errors: @game.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /games/1 or /games/1.json
  def update
    if @game.update(game_params)
      ActionCable.server.broadcast('GamesChannel', @game.as_json(include: [{ players: { include: :effects } }, { monsters: { include: :effects } }]))
      render json: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /games/1 or /games/1.json
  def destroy
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url, notice: "Game was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find_by_code(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:code, :name, :fight, :user_id, :turn, :active)
    end

    def current_user
      @current_user
    end

    def authenticate_user!
      session_token = params[:session]
  
      if session_token.present?
        payload = JWT.decode(session_token, Rails.application.secrets.secret_key_base).first
        user_id = payload["user_id"]
        @current_user = User.find_by(id: user_id)
      end
  
      render json: { error: "Unauthorized" }, status: :unauthorized unless @current_user
    rescue JWT::DecodeError
      render json: { error: "Invalid token" }, status: :unauthorized
    end
end
