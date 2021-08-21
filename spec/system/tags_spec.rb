require 'rails_helper'

RSpec.describe 'タグ機能', type: :system do

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

  describe 'タグ機能' do
    before do
      visit new_user_session_path
      fill_in 'メールアドレス', with: 'user_a@dic.com'
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
    end
    before do
      visit new_article_path
      fill_in "タイトルを入力してください", with: "newpost"
      fill_in "内容を入力してください（マークダウン記法対応）", with: "newcontent"
      first(".tag_label_checkbox").check
      click_button '投稿'
      click_button '投稿'
    end

    context '記事をタグをつけて新規作成した場合' do
      it '作成した記事が表示される' do
        expect(page).to have_content 'tag'
      end
    end
  end

  describe 'タグ作成機能' do
    before do
      visit new_user_session_path
      fill_in 'メールアドレス', with: 'admin@dic.com'
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
      visit rails_admin_path
      page.all(".pjax")[7].click
      click_link '新規作成'
      fill_in 'Name', with: 'new_create_tag'
      click_button '保存'
    end
    context '記事をタグをつけて新規作成した場合' do
      it '作成した記事が表示される' do
        visit new_article_path
        expect(page).to have_content 'new_create_tag'
      end
    end
  end

end
