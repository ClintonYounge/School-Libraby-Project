class Storage
  def load_people(people)
    return unless File.exist?('people.json')

    people_data = JSON.parse(File.read('people.json'))
    people_data.each do |person_data|
      if person_data['type'] == 'Student'
        student = Student.new(person_data['classroom'], person_data['name'],
                              person_data['age'].to_i,
                              parent_permission: person_data['parent_permission'],
                              id: person_data['id'])
        people.push(student)
      elsif person_data['type'] == 'Teacher'
        teacher = Teacher.new(
          person_data['specialization'],
          person_data['name'],
          person_data['age'].to_i,
          id: person_data['id']
        )
        people.push(teacher)
      end
    end
  end
end
