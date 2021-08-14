class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  # <<アクティブストレージの設定関連>>
  has_one_attached :image

    # <<アソシエーション>>
    belongs_to :user
    has_one :order

    #<<バリデーション>>
  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :price
  end

  #　金額の範囲
  validates_inclusion_of :price, in: 300..9999999
  # /\A[0-9]+\z/i半角数字のみ
  # ..:rubyの範囲オブジェクト　https://docs.ruby-lang.org/ja/latest/class/Range.html

  #選択関係で[---]のままになっていないか検証
  with_options presence: true,numericality: { other_than: 0 } do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end
 
end
