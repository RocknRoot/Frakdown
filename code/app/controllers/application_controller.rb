class ApplicationController < HK::Controller
  def on_exception
    reroute 'page', 'show'
  end
end
