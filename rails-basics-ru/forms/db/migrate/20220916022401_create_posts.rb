class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.string :summary, null: false
      t.boolean :published, null: false, default: false

      t.timestamps
    end
  end
end
