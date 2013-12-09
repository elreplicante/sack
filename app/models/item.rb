class Item
  include Mongoid::Document
  field :url, type: String
  field :name, type: String
  field :description, type: String

  attr_accessor :url
  validates_presence_of :url, :name, :description

  before_save :set_url

  private
  def set_url
    @url = 'http://' << @url unless valid_url?
  end

  def valid_url?
    @url.starts_with?('http://') || @url.starts_with?('https://')
  end
end
