require 'rails_helper'

RSpec.describe 'ユーザー登録機能', type: :model do

  describe 'バリデーションのテスト' do
    context '名前が空の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.create(:user)
        user.name = ""
        expect(user).not_to be_valid
      end
    end
    context 'メールアドレスが空の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.create(:user)
        user.email = ""
        expect(user).not_to be_valid
      end
    end
    context 'パスワードが空の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.create(:user)
        user.password = ""
        expect(user).not_to be_valid
      end
    end
    context '名前が256文字以上の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.create(:user)
        user.name = "a" * 256
        expect(user).not_to be_valid
      end
    end
    context 'メールアドレスが256文字以上の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.create(:user)
        user.email = "a" * 256 + "@" + "dic.com"
        expect(user).not_to be_valid
      end
    end
    context 'メールアドレスが255文字以下の場合' do
      it '登録される' do
        user = FactoryBot.create(:user)
        user.email = "a" * 200 + "@" + "dic.com"
        expect(user).to be_valid
      end
    end
    context '名前とメールアドレスとパスワードが内容が入力されている場合' do
      it '登録される' do
        user = FactoryBot.create(:user)
        expect(user).to be_valid
      end
    end
  end

end
