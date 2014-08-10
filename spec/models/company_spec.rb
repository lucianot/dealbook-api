require 'rails_helper'

describe Company, :type => :model do
  it 'has a valid factory' do
    company = FactoryGirl.create(:company)
    expect(company).to be_valid
  end
end
