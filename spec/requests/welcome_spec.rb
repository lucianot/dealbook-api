require 'rails_helper'

describe 'welcome request' do
  describe 'GET /' do
    it 'returns welcome message' do
      get '/', {}, { 'Accept' => 'application/json' }

      expect(response.status).to eq 200
      expect(response.body).to eq 'Welcome to Dealbook API'
    end
  end
end
