require 'spec_helper'

describe ItemsController do

  let(:sak) { create(:sak) } 
  let(:item) { build_stubbed(:item, sak: sak) }
  let(:persisted_item) { create(:item, sak: sak) } 
  let(:valid_item_attributes) { attributes_for :item }
  let(:valid_sak_attributes) { attributes_for :sak }

  let(:valid_session) { {} }   

  describe "showing all items" do
    it "lists all items as @items" do
      get :index, {sak_id: sak.to_param }, valid_session

      expect(assigns(:items)).to eq([item])
    end
  end

  describe "showing an item" do
    xit "lists the item as @item" do
      get :show, { sak_id: sak.to_param, id: persisted_item.to_param }, valid_session

      expect(assigns(:persisted_item)).to eq(persisted_item)
    end
  end

  describe "Creating an item" do
    it "assigns a new item as @item" do
      get :new, {sak_id: sak.to_param}, valid_session

      expect(assigns(:item)).to be_a_new(Item)
    end

    describe "with valid params" do
      xit "creates a new item" do
        expect { post :create, { sak_id: sak.to_param, item: valid_item_attributes }, valid_session

        }.to change(Item, :count).by(1)
      end

      it "assigns a newly created item as @item" do
        post :create, { sak_id: sak.to_param, item: valid_item_attributes }, valid_session

        expect(assigns(:item)).to be_a(Item)
        expect(assigns(:item)).to be_persisted
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved item as @item" do
        Item.any_instance.stub(:save).and_return(false)
        post :create, { sak_id: sak.to_param, item: { title: "invalid value" } }, valid_session

        expect(assigns(:item)).to be_a_new(Item)
      end
    end
  end

  describe "editing an item" do
    xit "assigns the requested item as an @item" do
        get :edit, {sak_id: sak.to_param, id: item.to_param}, valid_session

        expect(assigns(:item)).to eq(item)
    end

    describe "with valid params" do
      xit "updates the requested item" do
        Item.any_instance.should_receive(:update).with({ "title" => "A name" })

        put :update, {
          sak_id: sak.to_param, 
          item: { title: "A name" }
          }, valid_session
      end

      xit "assigns the requested item as @item" do
        put :update, {
          sak_id: sak.to_param,
          id: item.to_param, 
          item: { title: "A name" }
          }, valid_session

        expect(assigns(:item)).to eq(item)
      end
    end

    describe "with invalid params" do
      xit "assigns the item as @item" do
        Item.any_instance.stub(:build).and_return(true)
        put :update, {
          sak_id: sak.to_param,
          id: persisted_item.to_param, 
          item: { title:  "" }
          }, valid_session

        assigns(:item).should eq(persisted_item)
      end
    end
  end

  describe "deleting an item" do
    xit "destroys the requested item" do
      persisted_item = create(:item, sak: sak)

      expect {
        delete :destroy, {sak_id: sak.to_param,
                          id: persisted_item.to_param },
                          valid_session
      }.to change(Item, :count).by(-1)
    end
  end

  describe "searching an item" do

    it "returns all items with an empty search" do
      get :index, {sak_id: sak.to_param, search: '' }, valid_session

      expect(assigns(:items)).to eq([item])
    end

    it "returns the item if the search contains an item keyword" do
      get :index, {sak_id: sak.to_param, search: 'search' }, valid_session

      expect(assigns(:items)).to eq([item])
    end

    it "returns the item if the search contains a word from title" do
      get :index, {sak_id: sak.to_param, search: 'sale' }, valid_session

      expect(assigns(:items)).to eq([item])
    end

    it "returns the item if the search contains a word from description" do
      get :index, {sak_id: sak.to_param, search: 'memorable' }, valid_session

      expect(assigns(:items)).to eq([item])
    end
  end
end
