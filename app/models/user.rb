class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  USER_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  USER_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  
  with_options presence: true do
    validates :nickname
    validates :email
    validates :password, format: { with: PASSWORD_REGEX, message: '半角英数字6文字以上で入力してください' }
    validates :birth_day
  end

  with_options presence: true, format: { with: USER_NAME_REGEX, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end
  
  with_options presence: true, format: { with: USER_NAME_KANA_REGEX, message: '全角カナを使用してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end

end
