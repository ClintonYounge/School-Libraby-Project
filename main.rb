require_relative 'app'

def main
  app = App.new
  app.welcome

  # Load other data
  app.students.load_students
  app.teachers.load_teachers
  app.library.load_books
  app.load_people
  app.load_rentals

  app.run

  # Save other data
  app.students.save_students
  app.teachers.save_teachers
  app.library.save_books
  app.save_rentals
  app.save_people
end

main
