class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages_list = @conversation.messages
    @messages_list.each do |message|
      if message.user_id != current_user.id 
        if message.read == false
          message.update(read: true)
        end
      end
    end
    @messages = Message.all.order('created_at').where(conversation_id: @conversation.id)
    @message = @conversation.messages.new
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def new
    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    @messages = Message.all.order('created_at').where(conversation_id: @conversation.id)
    if @message.save
      respond_to do |format|
        format.html { redirect_to conversation_messages_path(@conversation) }
        format.js {}
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
