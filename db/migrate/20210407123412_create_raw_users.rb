class CreateRawUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :raw_users do |t|
      t.string :email
      t.string :expiry
      t.string :token

      t.timestamps
    end
  end
end
