class Conversation < ApplicationRecord
  belongs_to :sender, foreign_key: 'sender_id', class_name: 'User'
  belongs_to :recipient, foreign_key: 'recipient_id', class_name: 'User'
  has_many :messages, dependent: :destroy
  validates_uniqueness_of :sender_id, scope: 'recipient_id'
  
  scope :between, ->(sender_id,recipient_id) do
    where('(conversations.sender_id = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND conversations.recipient_id =?)', sender_id,recipient_id, recipient_id, sender_id)
  end

  def find_recipient(current_user)
    if self.sender_id == current_user.id 
      User.find(self.recipient_id) 
    else 
      User.find(self.sender_id) 
    end 
  end

  def unread?(current_user)
    number_messages = 0
    number_read = 0
    self.messages.each do |message|
      if message.user_id != current_user.id
        number_messages += 1
        message.read ? number_read += 1 : next
      end
    end
    number_messages == number_read ? false : true
  end
end
