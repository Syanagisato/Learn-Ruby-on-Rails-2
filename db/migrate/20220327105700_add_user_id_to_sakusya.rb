class AddUserIdToSakusya < ActiveRecord::Migration[7.0]
  def change
    add_column :sakusyas, :user_id, :integer
  end
end
