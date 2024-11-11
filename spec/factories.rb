FactoryBot.define do
  factory :user do
    email_address { Faker::Internet.unique.email }
    password { "passwordsecret!" }
    password_confirmation { "passwordsecret!" }

    trait :admin do
      email_address { "admin_#{Faker::Internet.unique.email}" }
    end

    trait :guest do
      email_address { "guest_#{Faker::Internet.unique.email}" }
    end
  end

  factory :patient do
    association :user
    name { Faker::Name.name }
    email { Faker::Internet.email }
    responsible { Faker::Name.name }
    phone { Faker::PhoneNumber.phone_number }
    responsible_phone { Faker::PhoneNumber.phone_number }
    address { Faker::Address.full_address }
    emergency_type { Patient.emergency_types.keys.sample }

    trait :with_cardiac_arrest do
      emergency_type { "cardiac_arrest" }
    end

    trait :with_trauma do
      emergency_type { "trauma" }
    end

    trait :with_stroke do
      emergency_type { "stroke" }
    end
  end

  factory :session do
    association :user
    ip_address { Faker::Internet.ip_v4_address }
    user_agent { Faker::Internet.user_agent }

    # Variação de sessão com IPv6
    trait :ipv6 do
      ip_address { Faker::Internet.ip_v6_address }
    end
  end
end
