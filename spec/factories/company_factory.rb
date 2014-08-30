FactoryGirl.define do
  factory :company do
    name 'Magnetis'

    factory :complete_company do
      description 'Magnetis is an online financial advisor'
      website 'magnetis.com.br'
      markets 'Personal Finance'
      location 'São Paulo, Brazil'
    end
  end
end
