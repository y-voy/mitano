class AddConfirmableToDevise < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :confirmation_token, unique: true
    execute("UPDATE users SET confirmed_at = NOW()")
  end
end
