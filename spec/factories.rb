require 'faker'

FactoryGirl.define do
  factory :episode do |f|
    f.number { "#{rand(1..2)}.#{rand(1..21)}" }
    f.title { Faker::Company.name }
    f.date { Time.now.to_date }
    f.synopsis { Faker::Company.bs }
    f.vimeo_id { rand(31231231..321312321) }
  end

  factory :credit do |f|
    f.episode { create(:episode) }
    f.role { Faker::Name.name }
    f.category { %w(cast crew music).sample }
  end

  factory :player do |f|
    f.name { Faker::Name.name }
    f.facebook_id { rand(1..322312321321332) }
    f.link { Faker::Internet.url }
  end
end