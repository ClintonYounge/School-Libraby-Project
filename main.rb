require_relative 'app'

class Main
  def display_welcome_message
    puts 'Welcome to the School\'s Library'
    puts '--------------------------------'
  end

  def display_options
    puts ' '
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    puts '--------------------------------'
  end

  def handle_user_choice
    option = gets.chomp.to_i

    menu_options = {
      1 => :list_all_books,
      2 => :list_all_people,
      3 => :create_person,
      4 => :create_book,
      5 => :create_rental,
      6 => :list_rentals_for_person,
      7 => :exit
    }

    if menu_options.key?(option)
      send(menu_options[option])
    else
      puts 'Invalid option'
    end
  end

  app = App.new
  app.run
end

main
