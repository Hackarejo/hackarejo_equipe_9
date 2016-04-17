class VisitsController < ApplicationController
  # POST /visits
  def create
    @wireless = Wireless.where(name: params[:wireless_name]).first

    if @wireless.present?
      @shop = @wireless.shop
      @client = current_user.userable

      @shop.register_visit_by(@client)
    end
  end
end
