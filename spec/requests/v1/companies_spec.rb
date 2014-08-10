require 'rails_helper'

describe 'GET /companies' do
  it 'returns all the companies' do
    magnetis = FactoryGirl.create :company, name: 'Magnetis'
    rock_content = FactoryGirl.create :company, name: 'RockContent'

    get 'http://api.example.com/v1/companies', {}, { 'Accept' => 'application/json' }

    expect(response.status).to eq 200
    expect(response.body).not_to be_empty

    names = json.map { |m| m[:name] }
    expect(names).to match_array([magnetis.name, rock_content.name])
  end
end
