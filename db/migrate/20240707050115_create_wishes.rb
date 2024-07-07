class CreateWishes < ActiveRecord::Migration[6.0]
  def change
    create_table :wishes do |t|
      t.text :content, null: false, limit: 140
      t.string :user_name, null: false, limit: 20
      t.integer :likes_count, default: 0, null: false, limit: 200
      t.boolean :fulfilled, default: false
      t.datetime :remind_at

      t.timestamps

    end
  end
end
