FactoryGirl.define do
    given = 'user' + rand(1..10000).to_s
  factory :user do
    name given

     sequence(:email){|n| "user#{n}@factory.com" }
     password pw
     password_confirmation pw
     #role :member

  end
end
