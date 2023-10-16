# frozen_string_literal: true

# Messages
class MessagesController < ApplicationController
  include SessionsHelper
  before_action :logged_in_user

  def index
    @messages = Message.all
  end

  def create
    @message = current_user.messages.create!(message_params)
    redirect_to messages_path
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
