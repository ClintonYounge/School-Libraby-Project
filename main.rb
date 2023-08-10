require_relative 'app'

def main
  app = App.new
  app.welcome

  # Load IDs first
  Person.load_last_id

  # Load other data
  app.students.load_students
  app.teachers.load_teachers
  app.library.load_books
  app.load_people
  app.load_rentals

  app.run

  # Update and save the last used ID
  Person.update_last_id(Person.load_last_id)

  # Save other data
  app.students.save_students
  app.teachers.save_teachers
  app.library.save_books
  app.save_rentals
  app.save_people
end



main
