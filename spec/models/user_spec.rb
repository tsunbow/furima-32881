require 'rails_helper'

RSpec.describe User, type: :model do
  before do
     @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
    it '全ての項目の入力が存在すれば登録できる' do
      expect(@user).to be_valid
    end
   end

    context '新規登録できないとき' do
    it "nicknameが空" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Nickname can't be blank")
    end
    it "emailが空" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Email can't be blank")
    end
    it "passwordが空" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password can't be blank")
    end
    it "password_confirmationが空でpasswordと一致しない" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
    end
    it "last_nameが空" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Last name can't be blank")
    end
    it "first_nameが空" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("First name can't be blank")
    end
    it "last_name_kanaが空" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Last name kana can't be blank")
    end
    it "first_name_kanaが空" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("First name kana can't be blank")
    end
    it "birth_dateが空" do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Birth date can't be blank")
    end
    it "emailが重複している" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "passwordが６文字未満" do
      @user.password = "a1234"
      @user.password_confirmation = "a1234"
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password is too short (minimum is 6 characters)")
    end
    it "emailに＠が無い" do
      @user.email = "testexample"
      @user.valid?
      expect(@user.errors.full_messages).to include ("Email is invalid")
    end
  end
 end
end
