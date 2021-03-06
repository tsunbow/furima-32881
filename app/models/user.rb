class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

      
          validates :nickname, presence: true
          validates :email, presence: true, uniqueness: true
          validates :password, presence: true, length: { minimum: 6 }, format:{with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i} 
          with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/} do
            validates :last_name
            validates :first_name
          end
          with_options presence: true, format: { with: /\A[ァ-ヶ一]+\z/} do
            validates :last_name_kana
            validates :first_name_kana
          end
          validates :birth_date, presence: true


end
