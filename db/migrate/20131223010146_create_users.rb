class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :provider
      t.string :uid
      t.string :key
      t.integer :limit, default: 0
      t.integer :sent, default: 0
      t.integer :month, default: 1

      t.timestamps
    end
  end
end
