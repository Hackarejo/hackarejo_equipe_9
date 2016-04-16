class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.references :client, index: true, foreign_key: true
      t.references :shop, index: true, foreign_key: true
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
