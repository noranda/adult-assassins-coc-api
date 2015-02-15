class UserSessionSerializer < ActiveModel::Serializer
  attributes :user_id, :token

  def token
    object.token
  end
end
