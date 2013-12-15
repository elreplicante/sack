require 'spec_helper'

describe "StaticPages" do

  subject { page }

  describe "Home page" do
    before { visit 'static_pages/home' }
    
    it { should have_content('sack') }
    it { should have_title('sack') }
  end
end
