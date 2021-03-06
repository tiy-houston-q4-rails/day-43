class ApiKeysController < ApplicationController
  before_action :set_api_key, only: [:show, :edit, :update, :destroy]

  # GET /api_keys
  # GET /api_keys.json
  def index
    @api_keys = ApiKey.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @api_keys }
    end
  end

  # GET /api_keys/1
  # GET /api_keys/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @api_key }
    end
  end

  # GET /api_keys/new
  def new
    @api_key = ApiKey.new
  end

  # GET /api_keys/1/edit
  def edit
  end

  # POST /api_keys
  # POST /api_keys.json
  def create
    @api_key = ApiKey.new(api_key_params)

    respond_to do |format|
      if @api_key.save
        format.html { redirect_to @api_key, notice: 'Api key was successfully created.' }
        format.json { render json: @api_key, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @api_key.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api_keys/1
  # PATCH/PUT /api_keys/1.json
  def update
    respond_to do |format|
      if @api_key.update(api_key_params)
        format.html { redirect_to @api_key, notice: 'Api key was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @api_key.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api_keys/1
  # DELETE /api_keys/1.json
  def destroy
    @api_key.destroy
    respond_to do |format|
      format.html { redirect_to api_keys_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_key
      @api_key = ApiKey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_key_params
      params.require(:api_key).permit(:key, :name)
    end
end
