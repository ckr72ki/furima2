require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録'do
  context 'できるとき'do
    it '全て正常' do
      expect(@user).to be_valid
    end
  end
  context '登録できないとき'do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")  
    end
    it "emailが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "@マークの無いアドレスは登録できない" do
      @user.email = "aa1a.aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "emailの一意性"do
    @user.save
    another_user = FactoryBot.build(:user)
    another_user.email = @user.email
    another_user.valid?
      # binding.pry
    expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      binding.pry
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが５文字以下の場合、登録できない" do
      @user.password = "00000"
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが半角数字のみでは登録できない" do
      @user.password = "000000"
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordが全角英数字では登録できない" do
      @user.password = "ＱＱＱ１１１"
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "first_nameが空では登録できない" do
      @user.first_name = ""
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include("First name can't be blank")
      
    end
    it "first_nameがアルファベットでは登録できない" do
      @user.first_name = "hanaco"
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "last_nameが空では登録できない" do
      @user.last_name = ""
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "last_nameがアルファベットでは登録できない" do
      @user.last_name = "hanaco"
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "first_name_kanaがアルファベットでは登録できない" do
      @user.first_name_kana = "hanaco"
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include("First name kana is invalid")      
    end
    it "first_name_kanaが平仮名では登録できない" do
      @user.first_name_kana = "はなこ"
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include("First name kana is invalid")
      
    end
    it "last_name_kanaが空では登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "last_name_kanaがアルファベットでは登録できない" do
      @user.last_name_kana = "hanaco"
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
    it "birth_dateが空では登録できない" do
      @user.birth_date = ""
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
      
    end
  end
  end
end
