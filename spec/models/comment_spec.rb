require 'rails_helper'

RSpec.describe "コメント登録機能", type: :model do

  describe 'バリデーションのテスト' do
    context 'コメントが空の場合' do
      it 'バリデーションに引っかかる' do
        comment = FactoryBot.create(:comment)
        comment.content = ""
        expect(comment).not_to be_valid
      end
    end
    context 'コメントが入力されているの場合' do
      it '登録される' do
        comment = FactoryBot.create(:comment)
        expect(comment).to be_valid
      end
    end
  end

end
