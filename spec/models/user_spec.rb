require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nickname,email,password,password_confirmation,first_name,last_name,first_name_kana,last_name_kana,birth_dayが存在すれば登録出来ること" do
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "nicknameが重複していると登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, nickname: @user.nickname)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Nickname has already been taken")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "emailが重複していると登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "emailが@を含まないと登録できないこと" do
      @user.email = "abcdef.abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "passwordが空だと登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが5文字以下だと登録できないこと" do
      @user.password = "1qazx"
      @user.password_confirmation = "1qazx"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが半角数字のみでは登録できないこと" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 半角英数字6文字以上で入力してください")      
    end

    it "passwordが半角英字のみでは登録できないこと" do
      @user.password = "abcdef"
      @user.password_confirmation = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 半角英数字6文字以上で入力してください")      
    end

    it "passwordが全角では登録できないこと" do
      @user.password = "１ＱＡＺＸＳ"
      @user.password_confirmation = "１ＱＡＺＸＳ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 半角英数字6文字以上で入力してください")      
    end

    it "passwordが存在してもpassword_confirmationが空だと登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "first_nameが空だと登録できないこと" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "last_nameが空だと登録できないこと" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "first_nameが全角でないと登録できないこと" do
      @user.first_name = "abcde"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end

    it "last_nameが全角でないと登録できないこと" do
      @user.last_name = "abcde"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
    end

    it "first_name_kanaが空だと登録できないこと" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "last_name_kanaが空だと登録できないこと" do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it "first_name_kanaが全角カナでないと登録できないこと" do
      @user.first_name_kana = "あいうえお"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角カナを使用してください")
    end

    it "last_name_kanaが全角カナでないと登録できないこと" do
      @user.last_name_kana = "あいうえお"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana 全角カナを使用してください")      
    end

    it "birth_dayが空だと登録できないこと" do
      @user.birth_day = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end

  end
end