require 'spec_helper'

describe Item do

  let(:item) { build(:item) }

  describe "with valid attributes" do
    it "should be valid" do
      expect(build(:item)).to be_valid
    end
  end

  it { should have_fields(:url, :title, :description).of_type(String) }
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:title) }

  describe "Parsing an url" do
    let(:title) { "Example Domain" }
    let(:description) { "Mock description" }
    let(:content) do  '''
            <!DOCTYPE html>
              <html>
              <head>
                <title>'+title+'</title>
                <meta name="description"></meta>
              </head>
              <body>
                  
              </body>
              </html>
            '''
    end

    it "should set the item title with the website title" do
      item = build(:item, url: 'http://example.com')

      item.stub(:fetch_and_set_url).and_return(Nokogiri::HTML(content))

      expect(item.title).to eq(title)
    end
  end  
end
