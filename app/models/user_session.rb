class UserSession < ActiveRecord::Base
  belongs_to :user

  before_create { generate_token }

  def self.active
    accessed_at_field = UserSession.arel_table[:accessed_at]
    where(accessed_at_field.gteq(2.weeks.ago)).where(revoked_at: nil)
  end

  def self.authenticate(token)
    active.where(token: token).first if token.present?
  end

  def self.from_user(user, request)
    session = UserSession.new(user: user)
    session.access(request)
    session
  end

  def revoke!
    update_attributes!(revoked_at: Time.now)
  end

  def access(request)
    update_attributes(
      accessed_at: Time.now,
      ip:          request.ip,
      user_agent:  request.user_agent
    )
  end

  private

  def generate_token
    loop do
      self.token = SecureRandom.urlsafe_base64(64)
      break unless UserSession.exists?(token: token)
    end
  end
end
