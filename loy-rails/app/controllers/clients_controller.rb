class ClientsController < ApplicationController
  load_and_authorize_resource param_method: :client_params

  before_action :filter_manager!

  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.with_visit_at(current_user.userable.shop_id)
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @shop = current_user.userable.shop
    @visits = @client.visits_at(@shop)
  end

  # GET /clients/new
  # def new
  # end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  # def create
  #   respond_to do |format|
  #     if @client.save
  #       format.html { redirect_to @client, notice: 'Client was successfully created.' }
  #       format.json { render :show, status: :created, location: @client }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @client.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Cliente atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  # def destroy
  #   @client.destroy
  #   respond_to do |format|
  #     format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.from_user_shop(current_user).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:name, :cpf)
    end
end
