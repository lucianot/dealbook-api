require 'rails_helper'

describe 'routes for companies', type: :routing do
  it 'routes /companies to the companies controller' do
    expect(:get => '/v1/companies').to route_to(
      controller: 'v1/companies',
      action: 'index'
    )
  end
end
