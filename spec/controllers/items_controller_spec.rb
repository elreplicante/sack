require 'spec_helper'

describe ItemsController do

  let(:valid_attributes) { attributes_for :item }
  let(:item) { create(:item) }
  let(:valid_session) { {} }   

  describe "showing all items" do
    it "lists all items as @items" do
      get :index, {}, valid_session
      expect(assigns(:items)).to eq([item])
    end
  end
end
