class AddUserIdToTitle < ActiveRecord::Migration[7.0]
  def change
    add_column :titles, :user_id, :integer
  end
end
