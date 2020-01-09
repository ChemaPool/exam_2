# frozen_string_literal: true

class User
  include Mongoid::Document

  field :email, type: String
  field :name, type: String
  field :last_name, type: String
  field :mobile_phone, type: String
  field :work_place, type: String

  has_many :rents

  validates :name, :last_name, :mobile_phone, :work_place, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true

  after_create :send_mail

  private

  def send_mail
    UserMailer.new_user(self).deliver_now
  end
end
