class StaticPagesController < ApplicationController
  skip_authorization_check

  # GET /index
  def index
    if user_signed_in?
      redirect_to clients_path
    else
      @title = "Fidelis"
    end
  end
end
