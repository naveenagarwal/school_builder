class CreateTestResults < ActiveRecord::Migration
  def change
    create_table :test_results do |t|
      t.integer :marks_in_percentage
      t.integer :test_id
      t.integer :group_id
      t.integer :student_id

      t.timestamps
    end
  end
end
