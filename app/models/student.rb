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

end
