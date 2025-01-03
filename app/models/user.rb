class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :crypto_addresses, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :email_address, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }, if: :password_required?

  before_save :normalize_email

  private

  def normalize_email
    self.email_address = email_address.strip.downcase
  end

  def password_required?
    new_record? || password.present?
  end
end
