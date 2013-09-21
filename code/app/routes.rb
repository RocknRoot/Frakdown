HK::Application.router = HK::Router.new do |route|
  route.bind '/', { :method => :get, :controller => :page, :action => :show }
end
