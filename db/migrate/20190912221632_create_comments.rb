class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :user_id
      t.index :user_id
      t.integer :campaign_id
      t.index :campaign_id

      t.timestamps
    end
  end
end
