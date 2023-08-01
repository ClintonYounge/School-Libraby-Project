class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(name = 'Unknown', age = nil, parent_permission: true)
    @id = rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    @age.to_i >= 18 || @parent_permission
  end
end
