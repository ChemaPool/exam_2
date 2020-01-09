# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }

  describe 'Associations' do
    it { is_expected.to have_many(:rents) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:name) }
  end

  context 'Is valid' do
    it { expect(user).to be_valid }
  end

  context 'Save is successful' do
    it { expect(user.save).to be(true) }
  end
end
