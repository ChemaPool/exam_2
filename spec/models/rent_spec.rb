# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Rent, type: :model do
  let(:rent) { FactoryBot.build(:rent) }

  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:home) }
  end

  context 'Is valid' do
    it { expect(rent).to be_valid }
  end

  context 'Save is successful' do
    it { expect(rent.save).to be(true) }
  end
end
