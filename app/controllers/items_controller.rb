class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :edit, :update, :destroy]


  def index
    @items = Item.all
    @item = Item.new
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path, notice: 'Item was added to the sack' 
    else
      render action: :new
    end
  end

  def edit
    
  end

  def update
    if @item.update(item_params)
      redirect_to items_path, notice: 'Item was succesfuly updated'
    end
  end

  def destroy
    @item.destroy
  end

  protected
  def item_params
    params.require(:item).permit(:url, :title, :description)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
