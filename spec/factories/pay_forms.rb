FactoryBot.define do
  factory :pay_form do
    token { 'testtesttesttesttoken'}
    postal_code { '123-1234'}
    prefecture_id { 1 }
    city { '福岡市'}
    address { '中洲1-2-3'}
    building { 'プラート中洲8F '}
    phone_number{'09012341234'}

    # association :item
    # association :user
  end
end 
