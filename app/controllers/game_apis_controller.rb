require 'net/http'
require 'uri'
require Rails.root.join('lib/random_strings.rb').to_s
require Rails.root.join('lib/game_ai.rb').to_s
class GameApisController < ApplicationController
  before_action :login
  before_action :set_game_api, only: [:show, :edit, :update, :destroy, :send_params]
  before_action :set_game


  # GET /game_apis
  # GET /game_apis.json
  def index
    @game_apis = @game.game_apis.all
  end

  # GET /game_apis/1
  # GET /game_apis/1.json
  def show
    @all_results = current_user.results.all.where(game_id: @game.id, game_api_id: @game_api.id).limit(5)
  end

  # GET /game_apis/new
  def new
    @game_api = GameApi.new
    @game_api.parameters.build
  end

  # GET /game_apis/1/edit
  def edit
  end

  # POST /game_apis
  # POST /game_apis.json
  def create
    @game_api = GameApi.new(game_api_params)
    @game_api.game_id = @game.id
    respond_to do |format|
      if @game_api.save
        format.html { redirect_to game_game_api_path(game_id: @game.id, id: @game_api.id), notice: 'Game api was successfully created.' }
        format.json { render :show, status: :created, location: @game_api }
      else
        format.html { render :new }
        format.json { render json: @game_api.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_apis/1
  # PATCH/PUT /game_apis/1.json
  def update
    respond_to do |format|
      if @game_api.update(game_api_params)
        format.html { redirect_to game_game_api_path(game_id: @game.id, id: @game_api.id), notice: 'Game api was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_api }
      else
        format.html { render :edit }
        format.json { render json: @game_api.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_apis/1
  # DELETE /game_apis/1.json
  def destroy
    @game_api.destroy
    respond_to do |format|
      format.html { redirect_to game_game_apis_url(game_id: @game.id), notice: 'Game api was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def send_params
    # @send_url = @game.base_url + @game_api.end_point + '?token=' + current_user.token
    @send_url = @game.base_url + @game_api.end_point + '?token=' + current_user.token
    @game_api.parameters.each do |p|
      if params[p.param].present?
        @send_url += '&' + p.param + '=' + params[p.param]
        response_text = Net::HTTP.get(URI.parse(URI.escape(@send_url)))
        @response = {name: p.param, send_param: params[p.param], response: response_text}
        unless @response[:response].include?('Error')
          result_params = {
              parameter_id: Parameter.find_by_param(p.param).id,
              send_param: @response[:send_param],
              response: @response[:response],
              user_id: current_user.id,
              game_id: @game.id,
              game_api_id: @game_api.id
          }
          Result.create(result_params)
        end
      end
    end
  end

  def execute_create_methods
    # @result = RandomStrings.random_value
    @result = GameAI.create_value
  end

  def add_param
    GameApi.new.parameters.build
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_api
      @game_api = GameApi.find(params[:id])
    end

    def set_game
      @game = Game.find(params[:game_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_api_params
      params.require(:game_api).permit(:name, :end_point, parameters_attributes: [:id,:name, :param])
    end
end