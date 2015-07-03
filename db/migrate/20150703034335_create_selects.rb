class CreateSelects < ActiveRecord::Migration
  def change
    create_table :selects do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
