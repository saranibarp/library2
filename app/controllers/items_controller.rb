class ItemsController < ApplicationController
before_action :lookup_item_type
before_action :lookup_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = @item_type.items.new
  end

  def show
    #@item = @item_type.items.find(params[:id])
  end

  def create
    @item = @item_type.items.new(item_params)

    if @item.save
      @item.fetch_image
      redirect_to root_path, notice: "Success! We Added your thing!"
    else
      render :new
    end
  end

  def edit
    #@item = Item.find(params[:id])
  end

  def update
    #@item = Item.find(params[:id])

    if @item.update_attributes(item_params)
      @item.fetch_image
      redirect_to root_path, notice: "Success! We Edited your thing!"
    else
      render :edit
    end
  end

  def destroy
    #@item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path, notice: "Poof!"
  end

  def mark_as_completed
    @item = Item.find(params[:id])
    @item.mark_as_completed
    redirect_to root_path
  end
  
  private

  def item_params
    params.require(:item).permit(:title, :completed_on, :item_type_id)
  end

  def lookup_item_type
    @item_type = ItemType.find(params[:item_type_id])
  end

  def lookup_item
    @item = @item_type.items.find(params[:id])
  end
end