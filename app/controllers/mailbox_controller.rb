class MailboxController < ApplicationController
	before_action :authenticate_user!

  def notifications
    @notifications = mailbox.notifications
    @notifications.each { |n| n.mark_as_read(current_user) }
    
    @active = :notifications
  end

  def inbox
    @inbox = mailbox.inbox
    @active = :inbox
  end

  def sent
    @sent = mailbox.sentbox
    @active = :sent
  end

  def trash
    @trash = mailbox.trash
    @active = :trash
  end
end
