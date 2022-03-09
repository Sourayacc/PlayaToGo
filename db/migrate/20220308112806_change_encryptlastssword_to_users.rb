class ChangeEncryptlastsswordToUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :encryptlastssword
    add_column :users, :encrypted_password, :string, null: false, default: ""
  end
end
