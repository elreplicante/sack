require 'open-uri'

class Item
  include Mongoid::Document
  
  field :url, type: String
  field :title, type: String
  field :description, type: String

  attr_accessor :title

  validates_presence_of :url, :title, :description
  validates_url :url

  after_build :parser

  def title
    page = Nokogiri::HTML(open(url.to_s))
    self.title = page.css('title').text
  end

  def description
    self.description = 'Mock description'
  end

  def parser
    page = Nokogiri::HTML(open(url.to_s))
    title = page.css('title').text
  end
end
