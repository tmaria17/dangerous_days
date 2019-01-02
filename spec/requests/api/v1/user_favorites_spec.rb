require 'rails_helper'

describe "Favorites API" do
  it 'retrieves a list of favorites' do
    user = create(:user)
    create_list(:favorite, 5, user_id: user.id)

    get "/api/v1/user/favorites?api_key=#{user.api_key}"

    favorites = JSON.parse(response.body)
    
    expect(response).to be_successful
    expect(favorites.count).to eq(5)
    expect(favorites[0]).to have_key("id")
    expect(favorites[0]).to have_key("neo_reference_id")
    expect(favorites[0]).to have_key("neo_reference_id")
    expect(favorites[0]).to have_key("user_id")
    expect(favorites[0]).to have_key("asteroid")
  end
end
