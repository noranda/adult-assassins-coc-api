class AttackLogSerializer < ActiveModel::Serializer
  attributes :id, :attacker_id, :target_id, :score, :time
end
