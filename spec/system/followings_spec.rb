require 'rails_helper'

RSpec.describe 'お気に入りユーザー登録機能', type: :system do

  let!(:user) { FactoryBot.create(:user, name: "user_a", email: "user_a@dic.com") }
  let!(:user_foo) { FactoryBot.create(:user, name: "user_foo", email: "user_foo@dic.com") }
  let!(:admin) { FactoryBot.create(:admin) }
  let!(:article) { FactoryBot.create(:article, user: user) }
  let!(:article_a) { FactoryBot.create(:article, title: "article_a", user: user) }
  let!(:article_b) { FactoryBot.create(:article, title: "article_b", user: user) }
  let!(:article_foo) { FactoryBot.create(:article_foo, title: "foo", user: user_foo) }
  let!(:article_foo_a) { FactoryBot.create(:article_foo, title: "foo_a", user: user_foo) }
  let!(:article_foo_b) { FactoryBot.create(:article_foo, title: "foo_b", user: user_foo) }
  let!(:tag) { FactoryBot.create(:tag) }
  let!(:tag_a) { FactoryBot.create(:tag_a) }
  let!(:tag_b) { FactoryBot.create(:tag_b) }

  before do
    visit new_user_session_path
    fill_in 'メールアドレス', with: 'user_a@dic.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  describe 'お気に入りユーザー機能' do
    before do
      visit article_path(article_foo)
      find(".follow-btn").click
      find(".dropdown-toggle").click
      click_link 'お気に入りユーザ一覧'
    end

    context 'お気に入りユーザー登録した場合' do
      it 'お気に入りユーザ一覧に登録したユーザーが表示される' do
        expect(page).to have_content 'foo'
      end
      it 'お気に入りユーザ一覧からユーザーの投稿一覧に飛ぶことができる' do
        click_link "記事をみる"
        expect(page).to have_content 'foo'
        expect(page).to have_content 'foo_a'
        expect(page).to have_content 'foo_b'
      end
    end
  end

end
