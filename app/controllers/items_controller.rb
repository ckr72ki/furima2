class ItemsController < ApplicationController
  # ログイン状態のユーザーのみ、商品出品ページへ遷移できること
  # ログアウト状態のユーザーは、商品出品ページへ遷移しようとすると、ログインページへ遷移すること
  # ログアウト状態のユーザーでも、商品一覧表示ページを見ることができること
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  # before_action :move_to_index, only: [:edit, :update, :destory]


  def index
    # 上から、出品された日時が新しい順に表示されること("created_at DESC")
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    # エラーハンドリングができていること（入力に問題がある状態で「出品する」ボタンが押された場合、情報は保存されず、出品ページに戻りエラーメッセージが表示されること）
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    # @item = Item.includes(:user).order(created_at: :desc).with_attached_image
    return redirect_to root_path if current_user.id != @item.user.id ||  @item.order != nil
  end

  def update
    @item = Item.find(params[:id])
    # @item = Item.includes(:item_purchase).order(created_at: :desc).with_attached_image    @item.update(item_params)
    if current_user.id == @item.user.id
      @item.update(item_params)
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    @item = Item.find(params[:id])
    # @item = Item.includes(:item_purchase).order(created_at: :desc).with_attached_image    @item.destroy
    if current_user.id == @item.user.id
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  
  end
  
  private

  def item_params
    params.require(:item).permit(
      :image,
      :name,
      :info,
      :category_id,
      :sales_status_id,
      :shipping_fee_status_id,
      :prefecture_id,
      :scheduled_delivery_id,
      :price
    ).merge(user_id: current_user.id)
  end
  
  # def move_to_index
  #   return redirect_to root_path if current_user.id == @item.user.id
  # end
  
  

end
