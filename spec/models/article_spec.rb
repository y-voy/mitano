require 'rails_helper'

RSpec.describe '記事投稿機能', type: :model do

  describe 'バリデーションのテスト' do
    context 'タイトルが空の場合' do
      it 'バリデーションに引っかかる' do
        article = FactoryBot.create(:article)
        article.title = ""
        expect(article).not_to be_valid
      end
    end
    context '内容が空の場合' do
      it 'バリデーションに引っかかる' do
        article = FactoryBot.create(:article)
        article.content = ""
        expect(article).not_to be_valid
      end
    end
    context 'タイトルが61字以上の場合' do
      it 'バリデーションに引っかかる' do
        article = FactoryBot.create(:article)
        article.title = "a" * 61
        expect(article).not_to be_valid
      end
    end
    context 'タイトルと内容が入力されている場合' do
      it '登録される' do
        article = FactoryBot.create(:article)
        expect(article).to be_valid
      end
    end
  end

end
