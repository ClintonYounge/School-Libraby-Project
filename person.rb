require_relative 'nameable'
require_relative 'rental'

class Person < Nameable
  attr_reader :rentals
  attr_accessor :name, :age, :parent_permission

  def initialize(name = 'Unknown', age = nil, parent_permission: true)
    super()
    @id = generate_new_id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def generate_new_id
    rand(1..1000) # You can adjust the range as needed
  end

  def add_rental(rental)
    @rentals << rental
  end

  def correct_name
    @name
  end

  def can_use_services?
    @age.to_i >= 18 || @parent_permission
  end
end
