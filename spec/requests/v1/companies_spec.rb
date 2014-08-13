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

  describe 'POST /companies' do
    let(:company_name) { 'Conta Azul' }
    let(:request_headers) do
      {
        "Accept" => "application/json",
        "Content-Type" => "application/json"
      }
    end

    context 'with valid params' do
      let(:company_params) do
        {
          company: { name: company_name }
        }.to_json
      end

      it 'creates a new company' do
        post "/1/companies", company_params, request_headers

        expect(response.status).to eq 201
        expect(response.body).not_to be_empty
        expect(json[:name]).to eq company_name
      end
    end

    context 'with invalid params' do
      let(:company_params) do
        {
          company: { name: nil }
        }.to_json
      end

      it 'does not create a new company with invalid params' do
        post "/1/companies", company_params, request_headers

        expect(response.status).to eq 422
        expect(response.content_type).to eq "application/json"
      end
    end
  end
end
