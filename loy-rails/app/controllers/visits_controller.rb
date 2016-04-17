class VisitsController < ApplicationController
  skip_authorization_check

  # POST /visits
  def create
    @wireless = Wireless.where(name: params[:wireless_name]).first

    if @wireless.present?
      @shop = @wireless.shop
      @client = current_user.userable
      @visit = @shop.register_visit_by(@client)
    end

    respond_to do |format|
      if @visit.present?
        format.json { render :show, status: :ok, location: @visit }
      else
        format.json { render json: @visit, status: :unprocessable_entity }
      end
    end
  end

  private

    #def wireless_params
    #  params
    #end
end
