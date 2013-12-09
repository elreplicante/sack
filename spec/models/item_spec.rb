require 'spec_helper'

describe Item do

  let(:item) { build(:item) }

  describe "with valid attributes" do
    it "should be valid" do
      expect(build(:item)).to be_valid
    end
  end

  it { should have_fields(:url, :name, :description).of_type(String) }
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }

  
  it { should belong_to(:sack) }

  describe "url field" do
    it "can start with 'http://'" do
      expect(item.url).to start_with('http://')
    end

    it "adds 'http://' if not present" do
      item = create(:item, url: 'example.com')
      expect(item.url).to start_with('http://')
    end
  end

end
