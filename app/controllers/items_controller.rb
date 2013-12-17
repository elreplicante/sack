class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.search(params[:search])
    @item = Item.new
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    binding.pry
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
    if params.has_key?(:item)
      params.require(:item).permit(:url, :title, :description)
    else
      { url: request.raw_post }
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
