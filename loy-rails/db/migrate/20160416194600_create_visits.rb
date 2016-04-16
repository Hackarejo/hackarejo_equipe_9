class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.references :client, index: true, foreign_key: true
      t.references :shop, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
