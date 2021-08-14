require 'rails_helper'

RSpec.describe "タグ登録機能", type: :model do

  describe 'バリデーションのテスト' do
    context 'タグ名が空の場合' do
      it 'バリデーションに引っかかる' do
        tag = FactoryBot.create(:tag)
        tag.name = ""
        expect(tag).not_to be_valid
      end
    end
    context 'タグ名が31字以上の場合' do
      it 'バリデーションに引っかかる' do
        tag = FactoryBot.create(:tag)
        tag.name = "a" * 31
        expect(tag).not_to be_valid
      end
    end
    context 'タグ名が入力されている場合' do
      it '登録される' do
        tag = FactoryBot.create(:tag)
        expect(tag).to be_valid
      end
    end
  end

end
