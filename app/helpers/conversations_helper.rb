module ConversationsHelper
  def my_conversations
    Conversation.where(sender_id: current_user.id).or(Conversation.where(recipient_id: current_user.id))
  end
end
