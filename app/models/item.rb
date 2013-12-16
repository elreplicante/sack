class Item
  include Mongoid::Document
  include Mongoid::Search
  include Mongoid::Attributes::Dynamic
  
  field :url, type: String
  field :title, type: String
  field :description, type: String
  field :content, type: String

  validates_presence_of :url
  validates_url :url

  before_save :set_title, :set_content, :set_description

  search_in :title, :description, :content
  
  def self.search(search)
    if search
      full_text_search(search)
    else
      Item.all
    end
  end

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
    page = Pismo::Document.new(url)
    page.title
  end

  def fetch_content
    page = Pismo::Document.new(url)
    page.body
  end

  def fetch_description
    page = Pismo::Document.new(url)
    meta_desc = page.description
  end
end
