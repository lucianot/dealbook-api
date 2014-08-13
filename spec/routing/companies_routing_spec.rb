require 'rails_helper'

describe 'routes for companies', type: :routing do
  it 'routes /companies to the companies controller' do
    expect(:get => '/1/companies').to route_to(
      controller: 'v1/companies',
      action: 'index'
    )
  end

  it 'routes /companies/:id to the companies controller' do
    expect(:get => '/1/companies/1').to route_to(
      controller: 'v1/companies',
      action: 'show',
      id: '1'
    )
  end
end
