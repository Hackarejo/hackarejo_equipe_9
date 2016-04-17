class WirelessesController < ApplicationController
  load_and_authorize_resource param_method: :wireless_params

  before_action :filter_manager!

  # POST /wirelesses
  def index
    @wirelesses = Wireless.where(shop_id: current_user.userable.shop_id)
  end

  # GET /wirelesses/new
  def new
  end

  # GET /wirelesses/1/edit
  def edit
  end

  # POST /wirelesses
  # POST /wirelesses.json
  def create
    respond_to do |format|
      if @wireless.save
        format.html { redirect_to wirelesses_path, notice: 'Rede Wireless criada com sucesso.' }
        format.json { render :index, status: :created, location: @wireless }
      else
        format.html { render :new }
        format.json { render json: @wireless.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wireleses/1
  # PATCH/PUT /wirelesses/1.json
  def update
    respond_to do |format|
      if @wireless.update(wireless_params)
        format.html { redirect_to @wireless, notice: 'Rede Wireless atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @wireless }
      else
        format.html { render :edit }
        format.json { render json: @wireless.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def wireless_params
      params.require(:wireless).permit(:name)
    end
end
