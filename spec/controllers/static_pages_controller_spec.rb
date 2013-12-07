require 'spec_helper'

describe StaticPagesController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'home'
      expect(response).to be_success
    end
  end

end
