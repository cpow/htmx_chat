# frozen_string_literal: true

# UsersController
class UsersController < ApplicationController
  include SessionsHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params_create)
    if @user.save
      log_in @user
      redirect_to messages_path
    else
      flash.now[:danger] = 'Invalid username for some reason'
      redirect_to new_user_path
    end
  end

  private

  def user_params_create
    params.require(:user).permit(:username)
  end
end
