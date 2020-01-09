# frozen_string_literal: true

class Home
  include Mongoid::Document
  include Mongoid::Enum

  before_validation :set_total_amount

  field :price, type: Float
  field :location, type: Array
  field :total_amount, type: Float
  field :extra_service, type: Float
  field :master_home_id, type: String
  field :home_features, type: Hash, default: { garden: false, furnished: false, gym: false }
  enum :status, %i[in_progress published rented]

  has_many :rents
  belongs_to :owner

  validates :price, :extra_service, :total_amount, :home_features, :status, presence: true

  private

  def set_total_amount
    self.total_amount = price + extra_service
  end
end
