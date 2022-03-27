class CreateSakusyas < ActiveRecord::Migration[7.0]
  def change
    create_table :sakusyas do |t|
      t.string :name

      t.timestamps
    end
  end
end
