require 'rails_helper'

RSpec.describe PayForm, type: :model do
  before do
    # buyer = FactoryBot.create(:user)
    # seller = FactoryBot.create(:user)
    # item = FactoryBot.build(:item, user_id: seller.id)
    # item.save
    # @order = FactoryBot.build(:pay_form, user_id: buyer.id,item_id: item.id )
    # sleep 1

    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:pay_form, user_id: user.id, item_id: item.id)
  end
  describe '商品購入' do
    context '内容に問題ない場合' do
      it '全て正常' do
        expect(@order).to be_valid
      end
      # it 'address:なくても保存ができる'
      end
    end
    context '内容に問題がある場合' do
      it 'postal_code: 必須' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_code:ハイフンがない'do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid")
      end
      it 'postal_code:文字が混じっている'do
        @order.postal_code = '123a456'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid")
      end
      it 'prefecture_id:必須'do
        @order.prefecture_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_id:0ではダメ'do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it 'city:必須'do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      # it 'address:必須'do
      #   @order.address = ""
      #   @order.valid?
      #   # binding.pry
      #   expect(@order.errors.full_messages).to include("Address can't be blank")
      # end
      it 'phone_number: 必須'do
        @order.phone_number = ""
        @order.valid?
        # binding.pry
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_number:数字１２桁以上はダメ'do
        @order.phone_number = "1234567890123"
        @order.valid?
        # binding.pry
        expect(@order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it 'phone_number:文字が混じっている'do
        @order.phone_number = "123aaaa1234"
        @order.valid?
        # binding.pry
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it 'user_id:必須'do
        @order.user_id = ""
        @order.valid?
        # binding.pry
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_id:必須'do
        @order.item_id = ""
        @order.valid?
        # binding.pry
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
      it 'token:必須'do
        @order.token = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
