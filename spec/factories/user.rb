# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    name { FFaker::NameMX.first_name }
    last_name { FFaker::NameMX.last_name }
    mobile_phone { FFaker::PhoneNumberMX.international_mobile_phone_number }
    work_place { FFaker::Company.name }
  end
end
