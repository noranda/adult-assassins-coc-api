class WarSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :war_size

  has_one :opposing_clan, embed: :ids, embed_in_root: true, root: :clans

  has_many :war_players, embed: :ids, embed_in_root: true, root: :war_players
end
