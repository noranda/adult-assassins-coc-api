class WarSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :war_size

  has_one :opposing_clan, embed: :ids, include: true, root: :clans
end
