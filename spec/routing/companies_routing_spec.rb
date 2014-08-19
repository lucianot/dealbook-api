require 'rails_helper'

describe 'routes for companies', type: :routing do
  it 'routes GET /companies to the companies controller' do
    expect(:get => '/1/companies').to route_to(
      controller: 'v1/companies',
      action: 'index'
    )
  end

  it 'routes GET /companies/:id to the companies controller' do
    expect(:get => '/1/companies/1').to route_to(
      controller: 'v1/companies',
      action: 'show',
      id: '1'
    )
  end

  it 'routes PUT /companies to the companies controller' do
    expect(:post => '/1/companies').to route_to(
      controller: 'v1/companies',
      action: 'create'
    )
  end

  it 'routes PATCH /companies/:id to the companies controller' do
    expect(:patch => '/1/companies/42').to route_to(
      controller: 'v1/companies',
      action: 'update',
      id: '42'
    )
  end
end
