require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(name = "Unknown", age: nil, parent_permission: true, specialization:)
    super(name, age, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

sir_mark = Teacher.new("Mark", age: 45, specialization: "Math")
puts sir_mark.name
puts sir_mark.age
puts sir_mark.specialization
puts sir_mark.can_use_services?
puts sir_mark.id
