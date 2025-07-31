module EventsHelper
  def invite_url(event)
    default_host+join_event_path(event.invite_token)
  end

  def default_host
    Rails.application.routes.default_url_options[:host] || "localhost:3000"
  end
end
