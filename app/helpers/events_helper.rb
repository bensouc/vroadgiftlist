module EventsHelper
  def invite_url(event)
    default_host+join_event_path(event.invite_token)
  end

  def default_host
  options = Rails.application.config.action_mailer.default_url_options
  host = options[:host]
  port = options[:port]
  "http://#{host}:#{port}"
  end
end
