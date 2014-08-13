require 'rails_helper'

describe 'companies requests' do
  let!(:magnetis)     { FactoryGirl.create :company, name: 'Magnetis' }
  let!(:rock_content) { FactoryGirl.create :company, name: 'RockContent' }

  describe 'GET /companies' do
    it 'returns all the companies' do
      get '/1/companies', {}, { 'Accept' => 'application/json' }

      expect(response.status).to eq 200
      expect(response.body).not_to be_empty

      names = json.map { |m| m[:name] }
      expect(names).to match_array([magnetis.name, rock_content.name])
    end
  end

  describe 'GET /companies/:id' do
    it 'returns a specific company' do
      get "/1/companies/#{magnetis.id}", {}, { 'Accept' => 'application/json' }

      expect(response.status).to eq 200
      expect(response.body).not_to be_empty
      expect(json[:name]).to eq magnetis.name
    end
  end
end
