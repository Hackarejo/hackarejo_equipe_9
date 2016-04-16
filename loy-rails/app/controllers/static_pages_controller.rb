class StaticPagesController < ApplicationController
  skip_authorization_check

  # GET /index
  def index
    if user_signed_in?
      # TODO
    else
      @title = "Fidelis"
    end
  end
end
