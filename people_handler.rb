class PeopleHandler
  def list_all_people(std, teach)
    students = std.grab_students
    teachers = teach.grab_teachers

    if students.empty?
      puts 'There is no student in the library'
    else
      students.each do |student|
        age = student.age
        parent_permission = student.parent_permission
        puts "[Student] Name: #{student.name}, Age: #{age}, ID: #{student.id}, Parental Perms: #{parent_permission}"
      end
    end

    if teachers.empty?
      puts 'There is no teacher in the library'
    else
      teachers.each do |teacher|
        name = teacher.name
        age = teacher.age
        puts "[Teacher] Name: #{name}, Age: #{age}, ID: #{teacher.id}, Specialization: #{teacher.specialization}"
      end
    end
  end
end
