class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all.page(params[:page])
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_params)
    if @items.save
    redirect_to admin_items_path
    else
      @items = Item.new

      render new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @items = Item.find(params[:id])
  end

  def update
    @items = Item.find(params[:id])
    @items.update(item_params)
    redirect_to admin_item_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image)
  end

end
