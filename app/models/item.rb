require 'open-uri'

class Item
  include Mongoid::Document
  
  field :url, type: String
  field :title, type: String
  field :description, type: String

  validates_presence_of :url, :title
  validates_url :url

  def title
    page = Nokogiri::HTML(open(url.to_s))
    title = page.css('title').text
  end
end
