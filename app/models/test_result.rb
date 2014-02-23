class TestResult < ActiveRecord::Base

  ###############
  # Associations
  ###############
  belongs_to :student
  belongs_to :group
  belongs_to :test

  ###############
  # Validations
  ###############
  validates :test_id, :group_id, :student_id, :marks_in_percentage, presence: true

end
