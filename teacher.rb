require_relative 'person'

class Teacher < Person
  attr_accessor :specialization
  attr_reader :id

  def initialize(specialization, name = 'Unknown', age = nil, parent_permission: true, id: nil)
    super(name, age, parent_permission: parent_permission)
    @id = id || generate_new_id
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
