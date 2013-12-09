class Sack
  include Mongoid::Document

  embeds_many :items
end