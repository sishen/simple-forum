class CreateUsersAndAuthentications < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.timestamps
      t.index  :email
    end

    create_table :authentications do |t|
      t.string   :provider,   :limit => 16
      t.string   :uid,        :limit => 64
      t.string   :token
      t.string   :secret
      t.belongs_to :user
      t.timestamps
      t.index    [:provider, :uid]
    end
  end
end
