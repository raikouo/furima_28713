class ItemsController < ApplicationController

  def index
  end
  
  def new
    @item = Item.new
  end

  def create
    item = Item.create(item_params)
    if item.save
      redirect_to root_path
    else
      
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :explain, :price, :image, :status_id, :postage_id, :shipping_date_id, :prefecture_id, :category_id).merge(user_id: current_user.id)
  end
end
