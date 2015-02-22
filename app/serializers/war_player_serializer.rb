class WarPlayerSerializer < ActiveModel::Serializer
  attributes :id, :position, :friendly, :war_id

  has_one :player, embed: :ids, embed_in_root: true
  has_many :attacks
  has_many :defenses
end
