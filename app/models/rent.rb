# frozen_string_literal: true

class Rent
  include Mongoid::Document
  include Mongoid::Enum

  enum :status, %i[in_progress published rented]

  belongs_to :user
  belongs_to :home

  validates :status, presence: true
end
