class Book < ApplicationRecord

validates :title, presence: true
validates :body, presence: true
# bookモデルが持っているカラム名をかく、Bookのテーブル
  
end
