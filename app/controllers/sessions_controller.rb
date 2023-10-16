# frozen_string_literal: true

# SessionsController
class SessionsController < ApplicationController
  def new; end

  def show
    log_out
    flash[:success] = 'You have logged out'
    redirect_to login_path
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user
      log_in user
      redirect_to messages_path
    else
      flash[:danger] = 'Invalid username for some reason'
      redirect_to new_user_path
    end
  end
end
