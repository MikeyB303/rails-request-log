class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  def new
  end

  def create
    user = User.find_by(username: params[:sessions][:username])
    if user && user.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      @errors = ["Invalid username/password combination"]
      render new_session_path
    end
  end

  def destroy
    session.destroy
    redirect_to "/"
  end
end