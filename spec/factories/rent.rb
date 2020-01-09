# frozen_string_literal: true

FactoryBot. define do
  factory :rent do
    user { FactoryBot.create(:user) }
    home { FactoryBot.create(:home) }
  end
end
