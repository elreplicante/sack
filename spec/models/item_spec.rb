require 'spec_helper'

describe Item do

  let(:item) { create(:item) }

  describe "with valid attributes" do
    it "should be valid" do
      expect(build(:item)).to be_valid
    end
  end

  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }


  describe "url field" do
    it "can start with 'http://'" do
      item = build(:item)
      expect(item.url).to start_with('http://')
    end
  end
end
