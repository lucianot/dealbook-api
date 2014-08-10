require 'rails_helper'

describe 'routes for companies', type: :routing do
  let(:url)     { "http://api.domain.com" }
  let(:bad_url) { "http://bad_url.domain.com" }

  it 'routes /companies to the companies controller' do
    expect(:get => "#{url}/v1/companies").to route_to(
      subdomain: 'api',
      controller: 'v1/companies',
      action: 'index'
    )
  end

  it 'does not routes' do
    expect(:get => "#{bad_url}/v1/companies").not_to route_to(
      subdomain: 'api',
      controller: 'v1/companies',
      action: 'index'
    )
  end
end
