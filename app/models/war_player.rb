class WarPlayer < ActiveRecord::Base
  belongs_to :player
  belongs_to :war

  has_many :attacks, class_name: 'AttackLog', foreign_key: :attacker_id
  has_many :defenses, class_name: 'AttackLog', foreign_key: :target_id
end
