class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.string :cnpj
      t.string :address
      t.string :phone
      t.string :email
      t.text :info
      t.string :company_name

      t.timestamps null: false
    end
  end
end
