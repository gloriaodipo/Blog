FactoryBot.define do
  factory :article do
    user { create :user }
    title { Faker::Lorem.sentence(word_count: 5) }
    body { Faker::Lorem.paragraph(sentence_count: 5, supplemental: false) }
  end
end
