class Item
  include Mongoid::Document
  include Mongoid::Search
  include Mongoid::Attributes::Dynamic
  
  field :url, type: String
  field :title, type: String
  field :description, type: String
  field :content, type: String

  belongs_to :sak

  validates_presence_of :url
  validates_url :url

  after_validation :fetch_url
  after_validation :set_title, :set_content, :set_description

  search_in :title, :description, :content
  
  def self.search(search)
    if search && search != ''
      return full_text_search(search)
    end
    Item.all
  end

  protected
  def fetch_url
    @page = Pismo::Document.new(url)
  end

  def set_title
    self.title = @page.title
  end

  def set_content
    self.content = @page.body
  end

  def set_description
    if @page.description == nil
      self.description ||= @page.lede
    else
      self.description ||= @page.description
    end
  end
end
