require 'rails_helper'

describe Venue, type: :model do
  describe '#display_t_accessible' do
    it 'when t_accessible is true display T is accessible.' do
      venue = FactoryGirl.create(:venue, t_accessible: true)

      text = venue.display_t_accessible

      expected_text = 'T is nearby'
      expect(text).to eq(expected_text)
    end
    it 'when t_accessible is false do not display anything .' do
      venue = FactoryGirl.create(:venue, t_accessible: false)

      text = venue.display_t_accessible

      expect(text).to eq('')
    end
  end
end
