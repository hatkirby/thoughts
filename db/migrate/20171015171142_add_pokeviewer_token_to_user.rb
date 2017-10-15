class AddPokeviewerTokenToUser < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.string :pokeviewer_token, limit: 191
    end

    add_index :users, :pokeviewer_token, unique: true
  end
end
