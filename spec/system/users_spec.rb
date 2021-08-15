require 'rails_helper'

RSpec.describe 'ユーザー管理機能', type: :system do

  let!(:user) { FactoryBot.create(:user) }
  let!(:admin) { FactoryBot.create(:admin) }

  describe 'ユーザー登録機能' do
    context 'ユーザーを新規登録した場合' do
      before do
        visit new_user_registration_path
        fill_in '名前', with: 'new_test_user'
        fill_in 'メールアドレス', with: 'new_test_user@dic.com'
        fill_in 'パスワード', with: 'password'
        fill_in '確認用パスワード', with: 'password'
        click_button '登録'
      end
      it '登録完了の表示がされる' do
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
      it '投稿ボタンが表示される' do
        expect(page).to have_content '投稿する'
      end
    end
    context 'ログイン前にタスク一覧に遷移しようとした場合' do
      before do
        visit articles_path
      end
      it '投稿ボタンが表示されない' do
        expect(page).not_to have_content '投稿する'
      end
      it 'ログインボタンが表示される' do
        expect(page).to have_content 'ログイン'
      end
    end
  end

  describe 'セッション機能' do
    before do
      visit new_user_session_path
      fill_in 'メールアドレス', with: 'tester@dic.com'
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
    end
    context 'ユーザーがログインをした場合' do
      it 'ログインした旨の表示がされる' do
        expect(page).to have_content 'ログインしました。'
      end
    end

    context 'ユーザーがログインをした場合' do
      before do
        visit articles_path
        find(".dropdown-toggle").click
        click_link 'プロフィール編集'
        fill_in '名前', with: 'edit_name'
        fill_in 'パスワード', with: 'password'
        fill_in '確認用パスワード', with: 'password'
        fill_in '現在のパスワード', with: 'password'
        click_button '更新'
      end
      it '自身のプロフィールを編集することができる' do
        expect(page).to have_content 'アカウント情報を変更しました。'
      end
    end

    context 'ユーザーがログインをした場合' do
      before do
        visit articles_path
        find(".dropdown-toggle").click
        click_link 'ログアウト'
      end
      it 'ログアウトができる' do
        expect(page).to have_content 'ログイン'
      end
    end
  end

  describe '管理画面機能' do
    context '一般ユーザーがログインした場合' do
      before do
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'tester@dic.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
        visit articles_path
        find(".dropdown-toggle").click
      end
      it '管理画面へのリンクが表示されない' do
        expect(page).not_to have_content '管理者画面へ'
      end
    end
    context '管理ユーザーがログインした場合' do
      before do
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'admin@dic.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
        visit rails_admin_path
      end
      it '管理画面にアクセスできる' do
        expect(page).to have_content 'サイト管理'
      end
    end
    context '管理ユーザーがログインした場合' do
      before do
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'admin@dic.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
        visit articles_path
        find(".dropdown-toggle").click
      end
      it '管理画面へのリンクが表示される' do
        expect(page).to have_content '管理者画面へ'
      end
    end
  end
end
