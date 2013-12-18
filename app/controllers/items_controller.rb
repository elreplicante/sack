class ItemsController < ApplicationController

  before_action :set_sak, except: [:show, :update]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  
  def index
    @items = @sak.items
    @item = Item.new
  end

  def show
  end

  def new
    @item = @sak.items.build
  end

  def create
    @item = @sak.items.build(item_params)
    if @item.save
      redirect_to sak_path(@sak), notice: 'Item was added to the sack' 
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to sak_path(@sak), notice: 'Item was succesfuly updated'
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

  def set_sak
    @sak = Sak.find(params[:sak_id])
  end
end
