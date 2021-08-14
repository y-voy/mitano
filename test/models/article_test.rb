require 'test_helper'

RSpec.describe Article, type: :model do
  # タイトルと製作年と上映時間と映倫区分があれば有効な状態であること
  it "is valid with a title, production_year, running_time, rating"
  # タイトルがなければ無効な状態であること
  it "is invalid without a title"
  # 重複したタイトルなら無効な状態であること
  it "is invalid with a duplicate title"
  # タイトルが101文字以上なら無効な状態であること
  it "is invalid with title is 101 or more characters"
end
