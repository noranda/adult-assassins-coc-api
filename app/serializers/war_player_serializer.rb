class WarPlayerSerializer < ActiveModel::Serializer
  attributes :id, :position, :friendly, :war_id

  has_one :player, embed: :ids, embed_in_root: true
  has_many :attack_logs, embed: :ids, embed_in_root: true

  def attack_logs
    object.attacks + object.defenses
  end
end
