class Sak
  include Mongoid::Document

  embeds_many :items
end
