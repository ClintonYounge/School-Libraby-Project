require_relative 'nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :parent_permission

  def initialize(name = 'Unknown', age = nil, parent_permission: true)
    super()
    @id = rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def correct_name
    @name
  end

  def can_use_services?
    @age.to_i >= 18 || @parent_permission
  end
end
