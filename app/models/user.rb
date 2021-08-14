class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #バリデーションをまとめてかけられる。
  # 条件付きのバリデーションを定義する
  with_options presence: true do
    # ニックネーム必須
    validates :nickname
    # 誕生日必須 
    validates :birth_date
    # ６文字以上半角英数字混合
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, allow_blank: true
  
  with_options format: { with: /\A[ぁ-んァ-ン一-龥]/} do
    validates :last_name  
    validates :first_name  
  end

  with_options format: { with: /\A[ァ-ヶー－]+\z/} do
    validates :last_name_kana  
    validates :first_name_kana
  end

  end
  has_many :items
  has_many :orders
end
