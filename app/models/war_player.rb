class WarPlayer < ActiveRecord::Base
  belongs_to :player
  belongs_to :war
end
