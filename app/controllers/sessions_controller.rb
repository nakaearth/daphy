class SessionsController < ApplicationController
  skip_before_action :login?, only: [:new, :create, :destroy, :oauth_failure]
  def new
    redirect_to '/auth/' + (Rails.env.production? ? params[:provider] : 'developer')
  end

  def create
    auth  = request.env['omniauth.auth']
    user = User.find_by(provider: auth[:provider], email: auth[:info][:name]) || User.create_account(auth)

    session[:user_id] = user.id
    logger.info user.try(:name)
    flash[:notice] = 'login successfully.'
    redirect_to controller: 'daphy/job_cards', action: 'index'
  end

  def destroy
    reset_session
    redirect_to controller: 'top', action: 'index', notice: 'login successfully.'
  end

  def oauth_failure
    flash[:notice] = "キャンセルしました。"
    redirect_to "/"
  end
end
