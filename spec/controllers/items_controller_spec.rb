require 'spec_helper'

describe ItemsController do

  let(:item) { create(:item) }
  let(:valid_attributes) { attributes_for :item }
  let(:valid_session) { {} }   

  describe "showing all items" do
    it "lists all items as @items" do
      get :index, {id: item.to_param }, valid_session

      expect(assigns(:items)).to eq([item])
    end
  end

  describe "showing an item" do
    it "lists the item as @item" do
      get :show, { id: item.to_param }, valid_session

      expect(assigns(:item)).to eq(item)
    end
  end

  describe "Creating an item" do
    it "assigns a new item as @item" do
      get :new, {}, valid_session

      expect(assigns(:item)).to be_a_new(Item)
    end

    describe "with valid params" do
      it "creates a new item" do
        expect { post :create, { item: valid_attributes }, valid_session

        }.to change(Item, :count).by(1)
      end

      it "assigns a newly created item as @item" do
        post :create, { item: valid_attributes }, valid_session

        expect(assigns(:item)).to be_a(Item)
        expect(assigns(:item)).to be_persisted
      end
    end

    describe "with invalid params" do
      before(:each) do
        Item.any_instance.stub(:save).and_return(false)
      end

      it "assigns a newly created but unsaved item as @item" do
        post :create, { item: { title: "invalid value" } }, valid_session

        expect(assigns(:item)).to be_a_new(Item)
      end
    end
  end

  describe "editing an item" do
    it "assigns the requested item as an @item" do
        get :edit, {id: item.to_param}, valid_session

        expect(assigns(:item)).to eq(item)
    end

    describe "with valid params" do
      it "updates the requested item" do
        Item.any_instance.should_receive(:update).with({ "title" => "A name" })

        put :update, {
          id: item.to_param, 
          item: { title: "A name" }
          }, valid_session
      end

      it "assigns the requested item as @item" do
        put :update, {
          id: item.to_param, 
          item: { title: "A name" }
          }, valid_session

        expect(assigns(:item)).to eq(item)
      end
    end

    describe "with invalid params" do
      it "assigns the item as @item" do
        Item.any_instance.stub(:build).and_return(true)
        put :update, {
          id: item.to_param, 
          item: { title:  "" }
          }, valid_session

        assigns(:item).should eq(item)
      end
    end
  end

  describe "deleting an item" do
    it "destroys the requested item" do
      item = create(:item)

      expect {
        delete :destroy, {id: item.to_param}, valid_session
      }.to change(Item, :count).by(-1)
    end
  end
end
