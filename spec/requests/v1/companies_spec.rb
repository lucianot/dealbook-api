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

      it 'does not create a new company' do
        post "/1/companies", company_params, request_headers

        expect(response.status).to eq 422
        expect(response.content_type).to eq "application/json"
      end
    end
  end

  describe 'PATCH /companies/:id' do
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

      it 'updates an existing company' do
        patch "/1/companies/#{magnetis.id}", company_params, request_headers

        expect(response.status).to eq 200
        expect(response.body).not_to be_empty
        expect(magnetis.reload.name).to eq company_name
      end
    end

    context 'with invalid params' do
      let(:company_params) do
        {
          company: { name: nil }
        }.to_json
      end

      it 'does not update an existing company' do
        patch "/1/companies/#{magnetis.id}", company_params, request_headers

        expect(response.status).to eq 422
        expect(response.content_type).to eq "application/json"
      end
    end
  end

  describe 'DELETE /companies/:id' do
    context 'with valid params' do
      it 'deletes an existing company' do
        delete "/1/companies/#{magnetis.id}"

        expect(response.status).to eq 204
        expect{ magnetis.reload }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
