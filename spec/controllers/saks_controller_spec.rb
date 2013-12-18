require 'spec_helper'

describe SaksController do

  let(:sak) { create(:sak) } 

  let(:persisted_item) { create(:item, sak: sak) } 
  let(:valid_item_attributes) { attributes_for :item }
  let(:valid_sak_attributes) { attributes_for :sak }

  let(:valid_session) { {} }   
    describe "searching an item" do

    xit "returns no with an empty search" do
      get :show, { sak_id: sak.to_param, search: '' }, valid_session

      expect(assigns(:items)).to eq([])
    end

    xit "returns the item if the search contains an item keyword" do
      get :show, {sak_id: sak.to_param, search: 'search' }, valid_session

      expect(assigns(:items)).to eq([item])
    end

    xit "returns the item if the search contains a word from title" do
      get :show, {sak_id: sak.to_param, search: 'sale' }, valid_session

      expect(assigns(:items)).to eq([item])
    end

    xit "returns the item if the search contains a word from description" do
      get :show, {sak_id: sak.to_param, search: 'memorable' }, valid_session

      expect(assigns(:items)).to eq([item])
    end
  end
end
