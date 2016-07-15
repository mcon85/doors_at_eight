require 'pusher'

class PusherService
  @@pusher = Pusher
  cattr_accessor :pusher

  def initialize(channel, event)
    @channel = channel
    @event = event
  end

  def trigger(data_hash)
    pusher.trigger(@channel, @event, data_hash)
  end
end
