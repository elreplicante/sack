require 'open-uri'

class Item
  include Mongoid::Document
  
  field :url, type: String
  field :title, type: String
  field :description, type: String

  validates_presence_of :url
  validates_url :url

  before_create :set_title
  
  def set_title
    logger.info '========='
    self.title = fetch_title
  end

  protected
  def fetch_title
    page = Nokogiri::HTML(RestClient.get(url.to_s))
    return page.css('title').text
  end
end
