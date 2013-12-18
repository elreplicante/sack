class SaksController < ApplicationController

  def index
    @saks = Sak.all
  end

  def show
    @sak = Sak.find(params[:id])
    @items = @sak.items
    @item ||= @sak.items.build
    @search_items = []
    if params[:search]
      @search_items = @sak.items.full_text_search(params[:search])
    end
  end
end
