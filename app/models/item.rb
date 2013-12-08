class Item
  include Mongoid::Document
  field :url, type: String
  field :name, type: String
  field :description, type: String

  validates_presence_of :url, :name, :description
end
