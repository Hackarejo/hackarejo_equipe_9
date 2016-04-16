class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  layout :layout_by_resource

  check_authorization unless: :devise_controller?

  before_filter :verify_access!

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      flash[:warning] = "Você não tem permissão para efetuar essa operação"
      format.html { redirect_to root_url}
      format.json { render json: flash[:warning], status: :unauthorized }
    end
  end

  private
  #
  # Filter admin
  #
  def filter_admin!
    return if current_user.admin?
    return if current_user.super_admin?
    redirect_to root_url
  end

  #
  # Verify access
  #
  def verify_access!
    authenticate_user! unless is_a? StaticPagesController
  end

  #
  # Layout by resource
  #
  def layout_by_resource
    if user_signed_in?
      "application"
    else
      "static_pages"
    end
  end

  #
  # Parse start date by params
  #
  def parse_start_date(params, options={})
    options[:default_start_date] ||= Date.today - 30.days
    params[:start_date].nil? ? options[:default_start_date] : Date.parse(params[:start_date])
  rescue
    options[:default_start_date]
  end

  #
  # Parse end date by params
  #
  def parse_end_date(params, options={})
    options[:default_end_date] ||= Date.today
    params[:end_date].nil? ? (options[:default_end_date]) : Date.parse(params[:end_date])
  rescue
    options[:default_end_date]
  end

  #
  # Parse start and end dates
  #
  def parse_dates(params, options={})
    options[:default_start_date] ||= Date.today - 30.days
    options[:default_end_date] ||= Date.today

    start_date = parse_start_date(params, options)
    end_date = parse_end_date(params, options)

    if (end_date - start_date).to_i > 180
      start_date = options[:default_start_date]
      end_date = options[:default_end_date]
    end

    return start_date, end_date
  end

  #
  # Configure permitted parameters
  #
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in).push(:name)
    devise_parameter_sanitizer.for(:sign_up).push(:name)
    devise_parameter_sanitizer.for(:account_update).push(:name)
  end
end
