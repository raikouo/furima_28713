require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('spec/fixtures/test_image.png')
    end

    it '全て入力とimageが存在していれば保存できること' do
      expect(@item).to be_valid
    end

    it 'imageがないと登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名がないと登録できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明がないと登録できないこと' do
      @item.explain = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Explain can't be blank")
    end

    it 'カテゴリーの選択がないと登録できないこと' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Category is not a number')
    end

    it '商品の状態の選択がないと登録できないこと' do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Status is not a number')
    end

    it '配送料の負担の選択がないと登録できないこと' do
      @item.postage_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Postage is not a number')
    end

    it '発送元の選択がないと登録できないこと' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture is not a number')
    end

    it '発送までの日数の選択がないと登録できないこと' do
      @item.shipping_date_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping date is not a number')
    end

    it '価格の入力がないと登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '商品名が41字以上だと登録できないこと' do
      @item.name = 'abcdefghijklmnopqrstuvwxyz123456789012345'
      @item.valid?
      expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
    end

    it '商品の説明が1001字以上だと登録できないこと' do
      @item.explain = Faker::Lorem.characters(number: 1001)
      @item.valid?
      expect(@item.errors.full_messages).to include('Explain is too long (maximum is 1000 characters)')
    end

    it '価格が300~9999999範囲外だと登録できないこと1' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it '価格が300~9999999範囲外だと登録できないこと2' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
  end
end
