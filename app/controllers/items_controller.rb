class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      @item.fetch_image
      redirect_to items_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update_attributes(item_params)
      @item.fetch_image
      redirect_to items_path
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  def mark_as_completed
    @item = Item.find(params[:id])
    @item.mark_as_completed
    redirect_to items_path
  end
  
  private

  def item_params
    params.require(:item).permit(:title, :completed_on, :item_type_id)
  end
end