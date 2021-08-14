FactoryBot.define do
  factory :user do
    nickname { Faker::Internet.username }
    password { '1a' + Faker::Internet.password(min_length: 7, max_length: 20) }
    email { Faker::Internet.free_email}
    # birth_date { Faker::Date.between_except(from: 20.year.ago, to: 1.year.from_now, excepted: Date.today) }
    birth_date {'2020-01-01'}
    first_name {'山田'}
    last_name {'太郎'}
    first_name_kana {'ヤマダ'}
    last_name_kana {'タロウ'}
  end
end
