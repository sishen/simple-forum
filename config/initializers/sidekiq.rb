Sidekiq.configure_server do |config|
  config.redis = { :url => 'redis://localhost:6379/0', :namespace => 'simple-forum' }
end

# When in Unicorn, this block needs to go in unicorn's `after_fork` callback:
Sidekiq.configure_client do |config|
  config.redis = { :url => 'redis://localhost:6379/0', :namespace => 'simple-forum' }
end
