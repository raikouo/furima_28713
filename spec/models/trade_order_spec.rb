require 'rails_helper'

RSpec.describe TradeOrder, type: :model do
  describe '#create' do
    before do
      @tradeorder = FactoryBot.build(:trade_order)
    end

    it '全ての値が正しく入力されていれば保存できること' do
      expect(@tradeorder).to be_valid
    end

    it 'トークンが空だと保存できないこと' do
      @tradeorder.token = nil
      @tradeorder.valid?
      expect(@tradeorder.errors.full_messages).to include("Token can't be blank")
    end

    it '電話番号が空だと登録できないこと' do
      @tradeorder.tel = nil
      @tradeorder.valid?
      expect(@tradeorder.errors.full_messages).to include("Tel can't be blank")
    end

    it '郵便番号が空だと登録できないこと' do
      @tradeorder.postal_code = nil
      @tradeorder.valid?
      expect(@tradeorder.errors.full_messages).to include("Postal code can't be blank")
    end

    it '都道府県が選ばれていないと登録できないこと1' do
      @tradeorder.prefecture_id = nil
      @tradeorder.valid?
      expect(@tradeorder.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
    end

    it '都道府県が選ばれていないと登録できないこと2' do
      @tradeorder.prefecture_id = 1
      @tradeorder.valid?
      expect(@tradeorder.errors.full_messages).to include('Prefecture must be other than 1')
    end

    it '市区町村が空だと登録できないこと' do
      @tradeorder.city = nil
      @tradeorder.valid?
      expect(@tradeorder.errors.full_messages).to include("City can't be blank")
    end

    it '番地が空だと登録できないこと' do
      @tradeorder.address = nil
      @tradeorder.valid?
      expect(@tradeorder.errors.full_messages).to include("Address can't be blank")
    end

    it 'user_idが空だと登録できないこと' do
      @tradeorder.user_id = nil
      @tradeorder.valid?
      expect(@tradeorder.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが空だと登録できないこと' do
      @tradeorder.item_id = nil
      @tradeorder.valid?
      expect(@tradeorder.errors.full_messages).to include("Item can't be blank")
    end

    it '郵便番号にハイフンがないと登録できないこと' do
      @tradeorder.postal_code = '1234567'
      @tradeorder.valid?
      expect(@tradeorder.errors.full_messages).to include('Postal code ハイフン有りの数字7桁で入力して下さい')
    end

    it '電話番号にハイフンがあると登録できないこと' do
      @tradeorder.tel = '080-1234-5678'
      @tradeorder.valid?
      expect(@tradeorder.errors.full_messages).to include('Tel ハイフン無しの数字10~11桁で入力して下さい')
    end

    it '電話番号が10-11桁でないと登録できないこと' do
      @tradeorder.tel = '080123456789'
      @tradeorder.valid?
      expect(@tradeorder.errors.full_messages).to include('Tel ハイフン無しの数字10~11桁で入力して下さい')
    end
  end
end
