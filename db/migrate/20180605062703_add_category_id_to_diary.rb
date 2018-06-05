class AddCategoryIdToDiary < ActiveRecord::Migration[5.1]
  def change
    add_reference :diaries, :category, foreign_key: true
  end
end
