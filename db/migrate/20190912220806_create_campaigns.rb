class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.text :sketch
      t.integer :user_id
      t.index :user_id

      t.timestamps
    end
  end
end
