class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :edit, :update, :destroy]


  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end

  def edit
    
  end

  def update
    @item.update(item_params)
  end

  def destroy
    @item.destroy
  end

  protected
  def item_params
    params.require(:item).permit(:url, :name, :description)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
