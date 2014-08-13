require 'rails_helper'

describe Company, :type => :model do
  it 'has a valid factory' do
    company = FactoryGirl.create(:company)
    expect(company).to be_valid
  end

  it 'must contain a name' do
    company = FactoryGirl.build(:company, name: nil)
    expect(company).not_to be_valid
  end

  it 'must contain an unique name' do
    company = FactoryGirl.create(:company)
    dupe = FactoryGirl.build(:company, name: company.name)
    expect(dupe).not_to be_valid
  end
end
