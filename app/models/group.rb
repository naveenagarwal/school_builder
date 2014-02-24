class Group < ActiveRecord::Base

  ###############
  # Associations
  ###############
  has_many :students
  has_many :test_results

  ###############
  # Class Methods
  ###############
  class << self

    def performance_data_for_charting
      tests = Test.all
      groups = Group.all

      average_marks, data = [], []

      groups.each_with_index do |group, index|
        test = nil
        tests.each do |t|
          test = t
          average_marks << {
              x: test.name,
              y: group.test_results_average_for(test.id)
            }
        end

        data << {
          values: average_marks,
          color:  COLORS[group.name],
          key:    group.name
        }

        average_marks = []
      end

      data
    end

    def combine_performance_data_for(grade: nil)
      data = {
          values: average_marks_for_groups(grade: grade),
          color: COLORS["9AB"],
          key: "9AB"
        }
    end

    private

    def average_marks_for_groups(grade: nil)
      group_ids = where(grade: grade).pluck(:id)
      tests = Test.all

      tests.map { |test|
          {
            x: test.name,
            y: average_marks(test_id: test.id, group_ids: group_ids)
          }
        }.flatten
    end

    def average_marks(test_id: nil, group_ids: nil)
      TestResult.where(
          test_id: test_id,
          group_id: group_ids
        ).average("marks_in_percentage").to_f
    end

  end

  #############
  # Public API
  #############

  def test_result_average
    test_results.average("marks_in_percentage").to_f
  end

  def test_results_average_for(test_id)
    test_results.where(test_id: test_id).average(:marks_in_percentage).to_f
  end

  def name
    "#{grade}#{section}"
  end

end
