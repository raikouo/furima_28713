class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_item, only: [:show, :destroy, :edit, :update]
  before_action :move_to_index, only: [:destroy, :edit, :update]
  before_action :search_item, only: [:index, :show, :search]

  def index
    @items = Item.all.order(id: 'DESC')
  end

  def new
    #@item = Item.new
    @item = ItemsTag.new
  end

  def create
    #@item = Item.new(item_params)
    @item = ItemsTag.new(item_tag_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def tag_search
    return nil if params[:input] == ""
    tag = Tag.where(['tag_name LIKE ?', "#{params[:input]}%"] ).order(created_at: 'DESC').limit(5)
    render json:{ keyword: tag }
  end
  
  def search
    @results = @p.result.order(id: 'DESC')
    @items = Item.all
    set_search
  end

  private

  def item_tag_params
    params.require(:items_tag).permit(:tag_name, :name, :explain, :price, :image, :status_id, :postage_id, :shipping_date_id, :prefecture_id, :category_id).merge(user_id: current_user.id)
  end
  
  def item_params
    params.require(:item).permit(:name, :explain, :price, :image, :status_id, :postage_id, :shipping_date_id, :prefecture_id, :category_id).merge(user_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end

  def search_item
    @p = Item.ransack(params[:q])
  end

  def set_search
    @category = Category.where.not(id: 1)
    @status = Status.where.not(id: 1)
    @postage = Postage.where.not(id: 1)
    @prefecture = Prefecture.where.not(id: 1)
    @shipping_date = ShippingDate.where.not(id: 1)
  end

  def move_to_index
    redirect_to root_path unless @item.trade.nil?
  end
end
