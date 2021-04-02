require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品購入機能' do
    context '商品購入できる時' do
      it '全ての項目の入力が存在すれば購入できる' do
        expect(@order).to be_valid
      end
      it '建物名がなくても登録できる' do
        @order.building_name = nil
        expect(@order).to be_valid
      end

      context '商品出品できない時' do
        it 'tokenが空では登録できないこと' do
          @order.token = nil
          @order.valid?
          expect(@order.errors.full_messages).to include("Token can't be blank")
        end
        it 'postal_codeが空' do
          @order.postal_code = ''
          @order.valid?
          expect(@order.errors.full_messages).to include('Postal code is invalid')
        end
        it 'postal_codeが半角数字でない' do
          @order.postal_code = '１２３-４５６７'
          @order.valid?
          expect(@order.errors.full_messages).to include('Postal code is invalid')
        end
        it 'postal_codeにハイフンがない' do
          @order.postal_code = '1234567'
          @order.valid?
          expect(@order.errors.full_messages).to include('Postal code is invalid')
        end
        it 'area-idが空（---）' do
          @order.area_id = 1
          @order.valid?
          expect(@order.errors.full_messages).to include('Area must be other than 1')
        end
        it 'municipalityが空' do
          @order.municipality = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("Municipality can't be blank")
        end
        it 'house_numberが空' do
          @order.house_number = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("House number can't be blank")
        end
        it 'phone_numberが空' do
          @order.phone_number = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("Phone number can't be blank")
        end
        it 'phone_numberが半角数字でない' do
          @order.phone_number = '０９０１２３４５６７８'
          @order.valid?
          expect(@order.errors.full_messages).to include('Phone number is invalid')
        end
        it 'phone_numberにハイフンがついている' do
          @order.phone_number = '090-1234-5678'
          @order.valid?
          expect(@order.errors.full_messages).to include('Phone number is invalid')
        end
        it 'phone_numberが12桁以上の時' do
          @order.phone_number = '090-1234-56789'
          @order.valid?
          expect(@order.errors.full_messages).to include('Phone number is invalid')
        end
        it 'user_idが空' do
          @order.user_id = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("User can't be blank")
        end
        it 'item_idが空' do
          @order.item_id = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("Item can't be blank")
        end

      end
    end
  end
end
