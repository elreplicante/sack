class Item
  include Mongoid::Document
  field :url, type: String
  field :name, type: String
  field :description, type: String
end
