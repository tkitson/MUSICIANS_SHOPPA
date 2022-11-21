class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :genre
      t.float :price
      t.text :details
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
