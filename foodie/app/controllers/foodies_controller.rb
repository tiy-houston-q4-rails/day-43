require 'pry'
class FoodiesController < ApplicationController

  before_action :verify_api_key
  before_action :authenticate_user!

  def index
    @foods = Food.all
    render json: @foods
  end

  def create
    @food = Food.new(params.require(:food).permit(:name))
    @food.save
    render json: @food
  end

  def show
    @food = Food.find(params[:id])
    render json: @food
  end

  def update
    @food = Food.find(params[:id])
    @food.update(params.require(:food).permit(:name))
    render json: @food
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    render json: {ok: true}
  end

  def verify_api_key
    if ApiKey.find_by key: request.headers["x-api-key"]
    else
      render json: {"status" => "invalid_api_key"}, status: 401
    end
  end

  def authenticate_user!
    user = User.find_by auth_token: request.headers["x-auth-token"]
    if user
      @current_user = user
    else
      render json: {"status" => "Invalid or missing auth token"}, status: 401
    end
  end
end
