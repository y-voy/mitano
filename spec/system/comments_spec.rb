require 'rails_helper'

RSpec.describe 'コメント機能', type: :system do

  let!(:user) { FactoryBot.create(:user, name: "user_a", email: "user_a@dic.com") }
  let!(:user_foo) { FactoryBot.create(:user, name: "user_foo", email: "user_foo@dic.com") }
  let!(:article) { FactoryBot.create(:article, user: user) }
  let!(:article_a) { FactoryBot.create(:article, title: "article_a", user: user) }
  let!(:article_b) { FactoryBot.create(:article, title: "article_b", user: user) }
  let!(:article_foo) { FactoryBot.create(:article, title: "foo", user: user_foo) }
  let!(:article_foo_a) { FactoryBot.create(:article, title: "foo_a", user: user_foo) }
  let!(:article_foo_b) { FactoryBot.create(:article, title: "foo_b", user: user_foo) }
  let!(:tag) { FactoryBot.create(:tag) }
  let!(:tag_a) { FactoryBot.create(:tag_a) }
  let!(:tag_b) { FactoryBot.create(:tag_b) }

  before do
    visit new_user_session_path
    fill_in 'メールアドレス', with: 'user_a@dic.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  describe 'コメント投稿機能' do
    before do
      visit article_path(article_foo)
      fill_in "コメントを入力する", with: "新しいコメント"
      click_button '投稿'
    end
    context 'コメントを投稿した場合' do
      it '投稿したコメントが表示される' do
        expect(page).to have_content '新しいコメント'
      end
    end
    context 'コメントを削除した場合' do
      it 'コメントが削除され表示されなくなる' do
        find(".delete-icon").click
        expect(page).not_to have_content '新しいコメント'
      end
    end
  end

end
