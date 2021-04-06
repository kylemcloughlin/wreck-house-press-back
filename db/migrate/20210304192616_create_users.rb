class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :c_id
      t.string :s_id      
      t.string :expiry      
      t.boolean :admin
      t.boolean :legacy
      t.string :password_reset_token
      t.datetime :password_reset_sent_at
      t.timestamps
    end
  end
end
