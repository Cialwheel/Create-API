class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :block_id
      t.string :fullname
      t.string :slug
      t.string :websiteUrl
      t.string :status
      t.string :volume
      t.timestamps
    end
    add_index :cities, :block_id
  end
end
