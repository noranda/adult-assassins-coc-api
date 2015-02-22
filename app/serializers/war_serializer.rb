class WarSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :war_size

  has_one :opposing_clan, embed: :ids, include: true, root: :clans

  has_many :war_players, embed: :ids, include: true, root: :war_players
end
