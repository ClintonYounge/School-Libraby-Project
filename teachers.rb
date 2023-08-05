class Teachers
  def initialize
    @teachers = []
  end

  def add_teacher(teacher)
    @teachers << teacher
  end

  def grab_teachers
    @teachers
  end
end
