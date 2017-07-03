class ConvertToRealUnicode < ActiveRecord::Migration[5.1]
  def change
    change_column :records, :recordable_type, :string, limit: 191
    change_column :users, :login, :string, default: "", null: false, limit: 191
    change_column :users, :email, :string, default: "", null: false, limit: 191
    change_column :users, :reset_password_token, :string, limit: 191
  end
end
