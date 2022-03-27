class AddUserIdToPublisher < ActiveRecord::Migration[7.0]
  def change
    add_column :publishers, :user_id, :integer
  end
end
