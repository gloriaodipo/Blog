require 'faker'

FactoryBot.define do
  factory :user do |f|
    f.name { Faker::Name.name}
    f.username { Faker::Name.unique.name }
    f.email { Faker::Internet.unique.email }
    f.password { Faker::Internet.password(min_length: 6) }
  end
end
