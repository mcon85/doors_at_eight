require 'pusher'

class PusherService

  def initialize(channel, event, pusher = Pusher)
    @channel = channel
    @event = event
    @pusher = pusher
  end

  def trigger(data_hash)
    @pusher.trigger(@channel, @event, data_hash);
  end
end
