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
      expect(@tradeorder.errors.full_messages).to include("カード情報を入力してください")
    end

    it '電話番号が空だと登録できないこと' do
      @tradeorder.tel = nil
      @tradeorder.valid?
      expect(@tradeorder.errors.full_messages).to include("電話番号を入力してください")
    end

    it '郵便番号が空だと登録できないこと' do
      @tradeorder.postal_code = nil
      @tradeorder.valid?
      expect(@tradeorder.errors.full_messages).to include("郵便番号を入力してください")
    end

    it '都道府県が選ばれていないと登録できないこと1' do
      @tradeorder.prefecture_id = nil
      @tradeorder.valid?
      expect(@tradeorder.errors.full_messages).to include("都道府県を入力してください", '都道府県を選択して下さい')
    end

    it '都道府県が選ばれていないと登録できないこと2' do
      @tradeorder.prefecture_id = 1
      @tradeorder.valid?
      expect(@tradeorder.errors.full_messages).to include('都道府県を選択して下さい')
    end

    it '市区町村が空だと登録できないこと' do
      @tradeorder.city = nil
      @tradeorder.valid?
      expect(@tradeorder.errors.full_messages).to include("市区町村を入力してください")
    end

    it '番地が空だと登録できないこと' do
      @tradeorder.address = nil
      @tradeorder.valid?
      expect(@tradeorder.errors.full_messages).to include("番地を入力してください")
    end

    it 'user_idが空だと登録できないこと' do
      @tradeorder.user_id = nil
      @tradeorder.valid?
      expect(@tradeorder.errors.full_messages).to include("Userを入力してください")
    end

    it 'item_idが空だと登録できないこと' do
      @tradeorder.item_id = nil
      @tradeorder.valid?
      expect(@tradeorder.errors.full_messages).to include("Itemを入力してください")
    end

    it '郵便番号にハイフンがないと登録できないこと' do
      @tradeorder.postal_code = '1234567'
      @tradeorder.valid?
      expect(@tradeorder.errors.full_messages).to include('郵便番号ハイフン有りの数字7桁で入力して下さい')
    end

    it '電話番号にハイフンがあると登録できないこと' do
      @tradeorder.tel = '080-1234-5678'
      @tradeorder.valid?
      expect(@tradeorder.errors.full_messages).to include('電話番号ハイフン無しの数字10~11桁で入力して下さい')
    end

    it '電話番号が10-11桁でないと登録できないこと' do
      @tradeorder.tel = '080123456789'
      @tradeorder.valid?
      expect(@tradeorder.errors.full_messages).to include('電話番号ハイフン無しの数字10~11桁で入力して下さい')
    end
  end
end
