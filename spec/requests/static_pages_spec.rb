require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    it "should have content 'sack'" do
      visit '/static_pages/home'
      expect(page).to have_content('sack')
    end

    it "has the rigth title" do
      visit '/static_pages/home'
      expect(page).to have_title('sack')
    end
  end
end
