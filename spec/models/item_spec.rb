require 'spec_helper'

describe Item do

  let(:item) { build(:item) }

  describe "with valid attributes" do
    it "should be valid" do
      expect(build(:item)).to be_valid
    end
  end

  it { should have_fields(:url, :title, :description, :content).of_type(String) }
  it { should validate_presence_of(:url) }


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
                  Hola Mundo
              </body>
              </html>
            '''
    end

    let(:body) { '<body>Hola Mundo</body>' } 

    it "should set the item title with the website title" do
      item = Item.new url: 'http://example.com'

      item.stub(:fetch_title).and_return(title)
      item.save!
      expect(item.title).to eq(title)
    end

    it "should set the item content with the website body" do
      item = Item.new url: 'http://example.com'

      item.stub(:fetch_content).and_return(body)
      item.save!
      expect(item.content).to eq('<body>Hola Mundo</body>')
    end
  end  
end
