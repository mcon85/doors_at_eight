require 'rails_helper'

feature 'user sees most recent reviews', js: true do

  scenario 'sees only 4 even when there are more than 4 reviews' do
    old = FactoryGirl.create_list(:review,
                                  6,
                                  created_at: "2015-07-11T16:09:39.692Z")
    newer = FactoryGirl.create_list(:review,
                                    4,
                                    created_at: "2016-07-11T16:09:39.692Z")
    visit root_path
    newer.each do |review|
      expect(page).to have_content(review.body)
    end
    old.each do |review|
      expect(page).not_to have_content(review.body)
    end
  end

  scenario 'sees only 2 reviews when there are only 2' do
    reviews = FactoryGirl.create_list(:review, 2)
    visit root_path
    reviews.each do |review|
      expect(page).to have_content(review.body)
    end
    expect(page).to have_css('.review', count: 2)
  end

  scenario 'sees none when there are no reviews' do
    visit root_path
    expect(page).not_to have_css('.review')
  end
end
