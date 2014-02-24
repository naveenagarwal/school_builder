class Student < ActiveRecord::Base

  ###############
  # Associations
  ###############
  has_many :test_results
  belongs_to :group

  ###############
  # Validations
  ###############
  validates :name, :group_id, presence: true

  ###############
  # Class Methods
  ###############
  class << self

    def performance_data_for_charting(group_ids: nil, student: nil)
      student = where(
                    group_id: group_ids,
                    id: student
                  ).first
      {
        values: student.test_result_data,
        color: COLORS["student"],
        key: student.name
      }
    end
  end

  ##################
  # Public Methods
  ##################

  def test_result_data
    test_results.includes(:test).map { |test_result|
      {
        x: test_result.test.name,
        y: test_result.marks_in_percentage
      }
    }
  end

end
