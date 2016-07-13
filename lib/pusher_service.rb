require 'pusher'

class PusherService

  def initialize(channel, event, pusher = Pusher)
    Pusher.app_id = ENV['PUSHER_APP_ID']
    Pusher.key = ENV['PUSHER_KEY']
    Pusher.secret = ENV['PUSHER_SECRET_KEY']
    Pusher.logger = Rails.logger
    Pusher.encrypted = true
    
    @channel = channel
    @event = event
    @pusher = pusher
  end

  def trigger(data_hash)
    @pusher.trigger(@channel, @event, data_hash);
  end
end
