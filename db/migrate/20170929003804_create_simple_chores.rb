class CreateSimpleChores < ActiveRecord::Migration[5.1]
  def change
    create_table :simple_chores do |t|
      t.string :name
      t.boolean :completed

      t.timestamps
    end
  end
end
