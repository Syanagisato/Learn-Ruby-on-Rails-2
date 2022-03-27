class AddUserIdToMain < ActiveRecord::Migration[7.0]
  def change
    add_column :mains, :user_id, :integer
  end
end
