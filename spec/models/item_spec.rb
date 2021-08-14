require 'rails_helper'

RSpec.describe Item, type: :model do
  before do 
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id)
  end

  describe '商品出品'do
    context 'できるとき'do
      it '全て正常' do
        expect(@item).to be_valid
      end
    end
    context 'できないとき' do
      it 'image:必須' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'name:必須' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'info:必須'do
        @item.info = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'price:必須' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'price:範囲指定（299円以下）'do
        @item.price = "100"
        @item.valid?
        # binding.pry
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it 'price:範囲指定（10 000 000円以上）'do
        @item.price = "10000001"
        @item.valid?
        # binding.pry
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it 'price:全角'do
        @item.price = "１０００"
        @item.valid?
        # binding.pry
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it 'price:半角数字以外'do
        @item.price = "aaaa"
        @item.valid?
        # binding.pry
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it 'category_id:0以外'do
        @item.category_id = 0
        @item.valid?
        # binding.pry
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it 'category_id:必須'do
      @item.category_id = nil
      @item.valid?
      # binding.pry
      expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'sales_status_id:0以外'do
      @item.sales_status_id = 0
      @item.valid?
      # binding.pry
      expect(@item.errors.full_messages).to include("Sales status must be other than 0")
      end
      it 'sales_status_id:必須'do
      @item.sales_status_id = nil
      @item.valid?
      # binding.pry
      expect(@item.errors.full_messages).to include("Sales status can't be blank")
      end
      it 'shipping_fee_status_id:0以外'do
      @item.shipping_fee_status_id = 0
      @item.valid?
      # binding.pry
      expect(@item.errors.full_messages).to include("Shipping fee status must be other than 0")
      end
      it 'shipping_fee_status_id:必須'do
      @item.shipping_fee_status_id = nil
      @item.valid?
      # binding.pry
      expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
      end
      it 'prefecture_id:0以外' do
        @item.prefecture_id = 0
        @item.valid?
        # binding.pry
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it 'prefecture_id:必須' do
        @item.prefecture_id = nil
        @item.valid?
        # binding.pry
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'scheduled_delivery_id:0以外' do
        @item.scheduled_delivery_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery must be other than 0")
      end
      it 'scheduled_delivery_id:必須' do
        @item.scheduled_delivery_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
      end
      it '出品にuserが必須であること' do
        @item.user_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
