class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :grade
      t.string :section

      t.timestamps
    end

    add_index :groups, :grade
    add_index :groups, :section
  end
end
