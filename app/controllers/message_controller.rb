class MessageController < ApplicationController

  def create
    chatroom = Chatroom.find_by_name(params[:chatroom])
    message = Message.new(messgae_params.merge({ user: @current_user, chatroom: chatroom}))
    if message.save
      render json: {data: message }, status: :ok
    else
      render json: {error: 'invalid data'}, status: :ok
    end
  end

  private

  def messgae_params
    params.permit(:content, :chatroom)
  end
end
