require_relative 'nameable'
require_relative 'rental'

class Person < Nameable
  attr_reader :rentals
  attr_accessor :name, :age, :parent_permission

  @@last_id = 0

  def initialize(name = 'Unknown', age = nil, parent_permission: true)
    super()
    @id = id || generate_new_id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def generate_new_id
    @@last_id += 1
    @@last_id
  end

  def add_rental(rental)
    @rentals << rental
  end

  def correct_name
    @name
  end

  def self.load_last_id
    last_id = 0
    last_id = File.read('last_id.txt').to_i if File.exist?('last_id.txt')
    last_id
  end

  def self.update_last_id(id)
    last_id = load_last_id
    new_last_id = [id, last_id].max
    File.write('last_id.txt', new_last_id.to_s)
  end

  def can_use_services?
    @age.to_i >= 18 || @parent_permission
  end
end
