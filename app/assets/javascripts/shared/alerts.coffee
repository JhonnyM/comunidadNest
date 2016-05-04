class @AlertNotification
  constructor:(container, notification) ->
    @container    = $(container)
    @notification = notification

  success_notification:() ->
    @container.prepend(@message(@notification, 'success'))

  error_notification:() ->
    @container.prepend(@message(@notification, 'danger'))

  message:(message, alert_class) ->
    text =  "<div class='alert alert-#{alert_class} fade in' style='margin-top:18px;'>"
    text += "<a aria-label='close' class='close' data-dismiss='alert' href='#' title='close'>×</a>"
    text += "<strong>#{message}</strong>"
    text += '</div>'
    text
