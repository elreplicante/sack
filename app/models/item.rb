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

  after_validation :fetch_url
  after_validation :set_title, :set_content, :set_description

  search_in :title, :description, :content
  
  def self.search(search)
    if search
      full_text_search(search)
    else
      Item.all
    end
  end

  protected
  def fetch_title
    @page.title
  end

  def fetch_content
    @page.body
  end

  def fetch_url
    @page = Pismo::Document.new(url)
  end

  def fetch_description
    @page.description
  end

  def set_title
    self.title = fetch_title
  end

  def set_content
    self.content = fetch_content
  end

  def set_description
    if fetch_description == nil
      self.description = @page.lede
    else
      self.description = fetch_description
    end
  end
end
