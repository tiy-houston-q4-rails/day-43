class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, unique: true, index: true
      t.string :auth_token, unique: true, index: true

      t.timestamps
    end
  end
end
