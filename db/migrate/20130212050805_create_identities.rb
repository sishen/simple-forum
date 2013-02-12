class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string :name,  length: 32
      t.string :email, length: 64
      t.string :password_digest
      t.string :confirmation_code, length: 32
      t.boolean :confirmed, default: false

      t.timestamps

      t.index :email
      t.index :confirmation_code
    end
  end
end
