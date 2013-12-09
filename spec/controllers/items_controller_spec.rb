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


  describe "showing an item" do
    it "lists the item as @item" do
      get :show, { id: item.to_param }, valid_session
      expect(assigns(:item)).to eq(item)
    end
  end

end
