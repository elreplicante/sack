class Item
  include Mongoid::Document
  
  field :url, type: String
  field :title, type: String
  field :description, type: String
  field :content, type: String

  validates_presence_of :url
  validates_url :url

  before_create :set_title, :set_content, :set_description
  
  def set_title
    self.title = fetch_title
  end

  def set_content
    self.content = fetch_content
  end

  def set_description
    self.description = fetch_description
  end

  protected
  def fetch_title
    page = Nokogiri::HTML(RestClient.get(url))
    page.css('title').text
  end

  def fetch_content
    page = Nokogiri::HTML(RestClient.get(url))
    page.css('body').text
  end

  def fetch_description
    page = Nokogiri::HTML(RestClient.get(url.to_s))
    meta_desc = page.css("meta[name='description']").first
    if meta_desc
      return meta_desc['content'] 
    end
    return '' 
  end
end
