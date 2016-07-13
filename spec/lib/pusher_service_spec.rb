require 'spec_helper'
require_relative '../../lib/pusher_service'

describe PusherService do
  let(:channel) { 'test_channel' }
  let(:event) { 'test_event' }
  let(:data) { { message: 'some information'} }
  let(:pusher_service) { PusherService.new(channel, event, FakePusher) }

  it 'accepts a channel and event type' do
    expect { PusherService.new(channel, event) }.not_to raise_error
  end

  it 'has a trigger method accepts data as a hash' do
    expect { pusher_service.trigger(data) }.not_to raise_error
  end

  it 'calls the pusher api and sends the data' do
    expect(FakePusher).to receive(:trigger).with(channel, event, data)

    pusher_service.trigger(data)
  end
end
