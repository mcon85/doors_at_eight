require 'rails_helper'

describe Venue, type: :model do
  it { should have_many(:reviews).dependent(:destroy) }

  it { should have_valid(:name).when('My Venue', 'Royale') }
  it { should_not have_valid(:name).when('', nil) }

  it { should have_valid(:capacity).when(1, 2, 35, '', nil) }
  it { should_not have_valid(:capacity).when('hghf') }

  it { should have_valid(:website).when('http://example.com', '', nil) }
  it { should_not have_valid(:website).when('hghf', 8) }

  it { should have_valid(:address).when('123 street') }
  it { should_not have_valid(:address).when('', nil) }

  it { should have_valid(:t_accessible).when(true, false) }
  it { should_not have_valid(:t_accessible).when('', nil) }

  describe '#display_t_accessible' do
    it 'when t_accessible is true display T is accessible.' do
      venue = FactoryGirl.create(:venue, t_accessible: true)

      text = venue.display_t_accessible

      expect(text).to eq('T is nearby')
    end

    it 'when t_accessible is false do not display anything .' do
      venue = FactoryGirl.create(:venue, t_accessible: false)

      text = venue.display_t_accessible

      expect(text).to eq('No nearby T station')
    end
  end

  describe '#short_name' do
    it "keeps short names the same" do
      venue = FactoryGirl.create(:venue, name: 'Short Name')

      expect(venue.short_name).to eq(venue.name)
    end

    it "shortens long venue names" do
      venue = FactoryGirl.create(:venue, name: 'This Is A Venue Music Hall')

      expect(venue.short_name).to eq('This Is A Venue Music...')
    end
  end
end
