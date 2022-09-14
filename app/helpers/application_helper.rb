module ApplicationHelper
  def bootstrap_class_for_flash(type)
    case type
      when 'notice' then "alert-info"
      when 'success' then "alert-success"
      when 'error' then "alert-danger"
      when 'alert' then "alert-warning"
    end
  end
  def bootstrap_title_for_flash(type)
    case type
      when 'notice' then "Information:"
      when 'success' then "succès !"
      when 'error' then "Erreur !"
      when 'alert' then "Attention !"
    end
  end

  def has_profile?
    current_user.is_artist || current_user.is_venue
  end

  def count_unread
    unread_conversations = 0
    my_conversations.each do |conversation|
      if conversation.unread?(current_user)
        unread_conversations += 1
      end
    end
    unread_conversations
  end
end
