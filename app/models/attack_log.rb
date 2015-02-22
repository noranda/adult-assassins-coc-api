class AttackLog < ActiveRecord::Base
  belongs_to :attacker, class_name: 'WarPlayer'
  belongs_to :target, class_name: 'WarPlayer'
end
