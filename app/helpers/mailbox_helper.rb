module MailboxHelper
  def has_unread_notifications?
    mailbox.notifications.unread.count > 0
  end
  
  def has_unread_inbox_messages?
    unread_messages_count > 0
  end
  
  def unread_notifications_count
    mailbox.notifications.unread.count
  end

  def unread_messages_count
    # how to get the number of unread messages for the current user
    # using mailboxer
    mailbox.inbox(:unread => true).count(:id, :distinct => true)
  end
end