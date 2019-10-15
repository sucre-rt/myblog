class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.text :title, null: false
      t.text :text
      t.text :image
      t.string :user_id, null: false
      t.timestamps
    end
  end
end
