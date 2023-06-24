class Public::HomesController < ApplicationController
  
  def top
    @item = Item.all.page(params[:page])
  end
  
  def about
  end
  
end
