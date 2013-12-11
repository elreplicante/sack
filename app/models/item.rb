require 'open-uri'

class Item
  include Mongoid::Document
  
  field :url, type: String
  field :title, type: String
  field :description, type: String

  attr_accessor :title

  validates_presence_of :url, :title, :description
  validates_url :url

  after_build :title

  def title
    self.title = parser.css('title').text
  end

  def description
    self.description = 'Mock description'
  end

  def parser
    Nokogiri::HTML(RestClient.get(url.to_s))
  end

end
