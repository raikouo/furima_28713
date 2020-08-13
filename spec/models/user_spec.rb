require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nickname,email,password,password_confirmation,first_name,last_name,first_name_kana,last_name_kana,birth_dayが存在すれば登録出来ること" do
    end

    it "nicknameが空では登録できないこと" do
    end

    it "emailが空では登録できないこと" do
    end

    it "emailが重複していると登録できないこと" do
    end

    it "emailが@を含まないと登録できないこと" do
    end

    it "passwordが空だと登録できないこと" do
    end

    it "passwordが5文字以下だと登録できないこと" do
    end

    it "passwordが英数字混合でないと登録できないこと" do
    end

    it "passwordが存在してもpassword_confirmationが空だと登録できないこと" do
    end

    it "first_nameが空だと登録できないこと" do
    end

    it "last_nameが空だと登録できないこと" do
    end

    it "first_nameが全角でないと登録できないこと" do
    end

    it "last_nameが全角でないと登録できないこと" do
    end

    it "first_name_kanaが空だと登録できないこと" do
    end

    it "last_name_kanaが空だと登録できないこと" do
    end

    it "first_name_kanaが全角カナでないと登録できないこと" do
    end

    it "first_name_kanaが全角カナでないと登録できないこと" do
    end

    it "birth_dayが空だと登録できないこと" do
    end

  end
end