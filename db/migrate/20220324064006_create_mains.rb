class CreateMains < ActiveRecord::Migration[7.0]
  def change
    create_table :mains do |t|
      t.integer :title_id
      t.integer :number
      t.integer :sakusya_id
      t.date :date
      t.integer :publisher_id

      t.timestamps
    end
  end
end
