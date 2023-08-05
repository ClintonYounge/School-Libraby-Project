class Students
  def initialize
    @students = []
  end

  def add_student(student)
    @students << student
  end

  def grab_students
    @students
  end
end
