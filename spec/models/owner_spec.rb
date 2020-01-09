# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Owner, type: :model do
  let(:owner) { FactoryBot.build(:owner) }

  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:homes) }
  end

  context 'Is valid' do
    it { expect(owner).to be_valid }
  end

  context 'Save is successful' do
    it { expect(owner.save).to be(true) }
  end
end
