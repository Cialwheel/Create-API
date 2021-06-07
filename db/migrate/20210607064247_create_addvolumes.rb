class CreateAddvolumes < ActiveRecord::Migration[5.0]
  def change
    create_table :addvolumes do |t|
      t.string :volume
      t.timestamps
    end
  end
end
