class ItemsController < ApplicationController

  before_action :set_sak, except: [:show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  
  def index
    @item = @sak.items.build
    @items = @sak.items
    @search_items = @sak.items.all
    if params[:search] && params[:search] != ''
      @search_items = @sak.items.full_text_search(params[:search])
    end
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
      redirect_to sak_path(@sak), error: "Something went wrong"
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
    if @item.destroy
      redirect_to sak_path(@sak), notice: 'Item was succesfuly deleted'
    else
      redirect_to sak_path(@sak), notice: 'Item not deleted'
    end
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
    @item = Sak.find(params[:sak_id]).items.find(params[:id])
  end

  def set_sak
    @sak = Sak.find(params[:sak_id] || params[:id])
  end
end
