require_relative 'app'

def main
  app = App.new
  app.welcome

  app.students.load_students
  app.teachers.load_teachers
  app.library.load_books
  app.load_rentals
  app.load_people

  app.run

  app.students.save_students
  app.teachers.save_teachers
  app.library.save_books
  app.save_rentals
end

main
