require 'rails_helper'
require_relative '../../lib/twitter_service'

describe TwitterService do
  let(:twitter_service) { TwitterService.new }
  let(:content) { 'This is my new tweet for the world!' }
  describe '#send_tweet' do
    it 'sends a tweet' do
      twitter_client = twitter_service.instance_variable_get(:@twitter)
      expect(twitter_client).to receive(:update).with(content)

      twitter_service.send_tweet(content)
    end
  end
end
