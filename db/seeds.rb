# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create class
puts "create class"

Group.create!([
    {
      section: "A",
      grade: 9
    },
    {
      section: "B",
      grade: 9
    },
  ])

# Create class students
puts " Create class students"
count = 1

["A", "B"].each do |section|
  group = Group.where(grade: 9, section: section).first

  10.times do
    group.students.create!(name: "student#{count}")
    count += 1
  end

end

group9a = Group.where(grade: 9, section: "A").first
group9b = Group.where(grade: 9, section: "B").first

# create tests
puts " create tests"
["FA1", "FA2", "SA1"].each { |test| Test.create!(name: test) }

fa1 = Test.where(name: "FA1").first
fa2 = Test.where(name: "FA2").first
sa1 = Test.where(name: "SA1").first

# create test results
puts " create test results"
# FA1, class 9A
puts "# FA1, class 9A"
[45, 85, 70, 71, 76, 71, 68, 56, 43, 61].each_with_index do |percentage, index|
  student = group9a.students.where(name: "student#{index + 1}").first

  fa1.test_results.create!(
      marks_in_percentage: percentage,
      student_id:          student.id,
      test_id:             fa1.id,
      group_id:            group9a.id
    )
end

# FA2, class 9A
puts "# FA2, class 9A"
[80, 78, 76, 88, 77, 83, 48, 51, 61, 77].each_with_index do |percentage, index|
  student = group9a.students.where(name: "student#{index + 1}").first

  fa2.test_results.create!(
      marks_in_percentage: percentage,
      student_id:          student.id,
      test_id:             fa2.id,
      group_id:            group9a.id
    )
end

# SA1, class 9A
puts "# SA1, class 9A"
[62, 50, 64, 65, 51, 58, 65, 50, 33, 22].each_with_index do |percentage, index|
  student = group9a.students.where(name: "student#{index + 1}").first

  sa1.test_results.create!(
      marks_in_percentage: percentage,
      student_id:          student.id,
      test_id:             sa1.id,
      group_id:            group9a.id
    )
end

# FA1, class 9B
puts "# FA1, class 9B"
[59, 49, 70, 77, 47, 78, 77, 43, 48, 43].each_with_index do |percentage, index|
  student = group9b.students.where(name: "student#{index + 11}").first

  fa1.test_results.create!(
      marks_in_percentage: percentage,
      student_id:          student.id,
      test_id:             fa1.id,
      group_id:            group9b.id
    )
end

# FA2, class 9B
puts "# FA2, class 9B"
[58, 44, 73, 32, 40, 87, 39, 44, 87, 79].each_with_index do |percentage, index|
  student = group9b.students.where(name: "student#{index + 11}").first

  fa2.test_results.create!(
      marks_in_percentage: percentage,
      student_id:          student.id,
      test_id:             fa2.id,
      group_id:            group9b.id
    )
end

# SA1, class 9B
puts "# SA1, class 9B"
[90, 73, 30, 34, 35, 81, 83, 35, 81, 45].each_with_index do |percentage, index|
  student = group9b.students.where(name: "student#{index + 11}").first

  sa1.test_results.create!(
      marks_in_percentage: percentage,
      student_id:          student.id,
      test_id:             sa1.id,
      group_id:            group9b.id
    )
end

