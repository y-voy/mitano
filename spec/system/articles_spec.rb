require 'rails_helper'

RSpec.describe '記事機能', type: :system do

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

  describe '新規作成機能' do
    before do
      visit new_article_path
      fill_in "タイトルを入力してください", with: "newpost"
      fill_in "内容を入力してください（マークダウン記法対応）", with: "newcontent"
      first(".tag_label_checkbox").check
      click_button '投稿'
      click_button '投稿'
    end

    context '記事を新規作成した場合' do
      it '作成した記事が表示される' do
        expect(page).to have_content 'newpost'
      end
    end
  end

  describe '一覧表示機能' do
    before do
      visit articles_path
    end

    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        expect(page).to have_content 'test_title'
        expect(page).to have_content 'article_a'
        expect(page).to have_content 'foo'
      end
    end

  describe '詳細表示機能' do
    before do
      visit article_path(article)
    end
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
         expect(page).to have_content 'test_content'
       end
     end
    end
  end

  describe '記事編集機能' do
    before do
      visit article_path(article)
      find(".edit-icon").click
      fill_in "タイトルを入力してください", with: "edit_title"
      click_button '投稿'
    end
     context '記事の編集をした場合' do
       it '編集の内容が表示される' do
         expect(page).to have_content 'edit_title'
       end
     end
  end

  describe '記事削除機能' do
    before do
      visit article_path(article_a)
      page.accept_confirm do
        click_on :delete_button
      end
    end
     context '記事を削除した場合' do
       it '削除成功の表示がされる' do
         expect(page).to have_content '記事を削除しました！'
       end
       it '削除した記事が表示されない' do
         expect(page).not_to have_content 'article_a'
       end
     end
  end

  describe '検索機能' do
    before do
      visit articles_path
      fill_in "name_search_feild", with: "foo"
      click_button "検索"
    end
    context '検索をした場合' do
      it "検索キーワードを含む記事で絞り込まれる" do
        expect(page).to have_content 'foo'
      end
      it "検索キーワードを含まない記事は表示されない" do
        expect(page).not_to have_content 'article_a'
      end
    end
  end

end
