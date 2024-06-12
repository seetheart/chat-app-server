class ChatroomController < ApplicationController
  def index
    render json: { chatrooms: Chatroom.all }
  end

  def messages
    chatroom = Chatroom.find_by_name(params[:name])
    if chatroom
      render json: { messages: message_info(chatroom.messages) }
    else
      render json: { error: "chatroom doesn't exist" }, status: :unprocessable_entity
    end
  end

  private

  def message_info(messages)
    messages.map {|mes| { mes: mes, name: mes.user.name}}
  end
end
