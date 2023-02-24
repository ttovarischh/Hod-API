PREFACE      = ('A'..'Z').to_a << ?_
SUFFIX       = ('0'..'9').to_a
PREFACE_SIZE = 2
SUFFIX_SIZE  = 3

class GamesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_game, only: %i[ show edit update destroy ]
  respond_to :json

  # GET /games or /games.json
  def index
    @games = Game.all
    render json: @games, include: [:players, :monsters]
  end

  # GET /games/1 or /games/1.json
  def show
    # @game = Game.find_by_slug(params[:code])
    # @game = Game.all
    @game = set_game

    render json: @game, include: [:players, :monsters]
    @qr = RQRCode::QRCode.new(game_url)
  end

  # GET /games/new
  def new
    @game = Game.new
    # @game.code = gen_name
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

    if @game.save
      render json: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end

    # respond_to do |format|
    #   if @game.save
    #     format.html { redirect_to game_url(@game), notice: "Game was successfully created." }
    #     format.json { render :show, status: :created, location: @game }
    #     format.json { 
    #       render json: game
    #     }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @game.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /games/1 or /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to game_url(@game), notice: "Game was successfully updated." }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
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
      # @game = Game.find_by_slug(params[:code])
      @game = Game.find_by_code(params[:id])
      # @game = Game.find_by(code: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:code, :name, :fight, :user_id, :turn)
    end
end
