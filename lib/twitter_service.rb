require 'twitter'

class TwitterService
  @@client = Twitter::REST::Client
  cattr_accessor :client

  def initialize
    @twitter = client.new do |config|
      config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
    end
  end

  def send_tweet(content)
    @twitter.update(content)
  end
end
