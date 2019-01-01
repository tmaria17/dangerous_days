require 'rails_helper'

describe 'as a user' do
  it 'displays dangerous day' do
    visit "/"
    fill_in :start_date, with: "2018-01-01"
    fill_in :end_date, with: "2018-01-07"
    click_on "Determine Most Dangerous Day"
    
    expect(current_path).to eq(most_dangerous_day_path)
    expect(page).to have_content("Most Dangerous Day")
    expect(page).to have_content("January 1, 2018 - January 7, 2018")

    within(first(".neo")) do
      expect(page).to have_css(".name")
      expect(page).to have_css(".neo_id")
    end
  end
end
# Feature: A guest user visits the root page and enters a start date and end date. The resulting page will display the most dangerous day in that range based on which day has the most `is_potentially_dangerous_asteroid` set to `true`. Given the scenario below, it should be January 1, 2018 with 3 potentially dangerous asteroids.
#
# As a guest user
# When I visit "/"
# And I enter "2018-01-01" into the start date
# And I enter "2018-01-07" into the end date
# And I click "Determine Most Dangerous Day"
#
# Then I should be on "/most_dangerous_day"
# And I should see a heading for "Most Dangerous Day"
# And I should see "January 1, 2018 - January 7, 2018"
# And I should see a heading for the most dangerous day in that range "January 1, 2018"
# And I should see 3 asteroids in that list
#
# And I should see "Name: (2014 KT76)"
# And I should see "NEO Reference ID: 3672906"
