class SaksController < ApplicationController

  def index
    @saks = Sak.all
  end

  def show
    @sak = Sak.find(params[:id])
    @items = @sak.items
    @item = @sak.items.build
  end
end
