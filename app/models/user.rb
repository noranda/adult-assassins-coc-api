class User < ActiveRecord::Base
  has_secure_password

  validates :password, length: { in: 6..64 }, on: :create
  validates :password_confirmation, length: { in: 6..64 }, on: :create
  validates :email, presence: true, uniqueness: { case_sensitive: false }, email: true

  def self.authenticate(email, password)
    where(email: email.try(:downcase)).first.try(:authenticate, password)
  end
end
