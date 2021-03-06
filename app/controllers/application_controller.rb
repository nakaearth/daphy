class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit

  before_action :login?
  before_action :set_groups
  helper_method :current_user
  helper_method :current_group
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404

  def current_user
    @current_user ||=  User.includes(:my_groups).find(session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound => ar
    logger.info "ユーザ情報がありません: #{ar.message}"
    session[:user_id] = nil
    nil
  end

  def current_group
    @current_group ||= current_user.my_groups.first
  end

  def set_groups
    @groups = current_user.try(:my_groups)
    @group_id = params[:group_id].presence || current_user.try(:my_groups[0]).try(:id)
  end

  def login?
    redirect_to :root if session[:user_id].blank?
  end

  def render_404
    render file: "#{Rails.root}/public/404.html", status: 404
  end
end
