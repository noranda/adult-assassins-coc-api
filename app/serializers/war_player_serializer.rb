class WarPlayerSerializer < ActiveModel::Serializer
  attributes :id, :position, :friendly, :war_id

  has_one :player, embed: :ids, include: true
end
