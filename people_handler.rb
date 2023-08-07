
class PeopleHandler
   
    def list_all_people(std, teach)
        students = std.grab_students
        teachers = teach.grab_teachers
    
        if students.empty?
          puts 'There is no student in the library'
        else
          puts ' '
          students.each do |student|
            puts "[Student] Name: #{student.name}, Age: #{student.age}, Parental Perms: #{student.parent_permission}"
          end
        end
    
        if teachers.empty?
          puts 'There is no teacher in the library'
        else
          puts ' '
          teachers.each do |teacher|
            puts "[Teacher] Name: #{teacher.name}, Age: #{teacher.age}, Specialization: #{teacher.specialization}"
          end
        end   
    end     
      
end