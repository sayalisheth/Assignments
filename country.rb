module War
  
  def win_war? country
    return true if (country.army.to_i > 100)
    return false
  end
  
end

module Loan

  def loan_from_IMF? country
    return true if country.state == "DEVELOPING" and country.gdp > 5.0
    return false
  end

  def loan_from_WorldBank? country
    return true if country.gdp > 8.0 and country.state == "DEVELOPED"
    return false
  end

end

module UN_seat
  
  def seat? country
    return true if country.gdp > 6.0 and country.army > 100 and country.state == "DEVELOPED" and country.population > 100
    return false
  end

end

class Country

  include War
  include Loan
  include UN_seat

  attr_reader :name, :population, :gdp, :states, :army, :state

  @@countries = {}

  def initialize(name, population, gdp, states, army, state)
    @name = name
    @population = population
    @gdp = gdp
    @states = states
    @army = army
    @state = state
  end

  def self.add_country(name, population, gdp, states, army, state)
    new_country = Country.new(name, population, gdp, states, army, state)
    @@countries[name] = new_country
    #puts @@countries
  end

  def display country
    puts country.name
    puts "\nName : #{country.name} \nPopulation : #{country.population} \nGDP : #{country.gdp}% \nNo of states : #{country.states}  \nArmy strength: #{country.army}\nState : #{country.state}"
  end


  while 1
    puts "------------------------------------\nEnter your choice\n1.Get loan from IMF\n2.Get loan from World Bank\n3.Have seat in the UN Security council.\n4.Win war\n5.Display country details\n6.Add new country\n7.Exit"
    choice = gets.chomp.to_i
    
    if choice < 6
      present_country_flag = 0
      puts "Enter country name"
      country_name = gets.chomp.upcase
      if @@countries.has_key?(country_name)
        present_country_flag = 1
      else 
        puts "Country not present"
      end
    end

    case choice
   
    when 1 
      if present_country_flag == 1
        if @@countries[country_name].loan_from_IMF? @@countries[country_name]
           puts "#{country_name} can get loan from IMF"
        else
          puts "#{country_name} cannot get loan from IMF"
        end
      end

    when 2
      if present_country_flag == 1
        if @@countries[country_name].loan_from_WorldBank? @@countries[country_name]
           puts "#{country_name} can get loan from World Bank"
        else
          puts "#{country_name} cannot get loan from World Bank"
        end
      end
      
    when 3
      if present_country_flag == 1
        if @@countries[country_name].seat? @@countries[country_name]
           puts "#{country_name} can get a seat in UN Security council"
        else
          puts "#{country_name} cannot get a seat in UN Security council"
        end
      end

    when 4
      if present_country_flag == 1
        if @@countries[country_name].win_war? @@countries[country_name]
          puts "#{country_name} can win war"
        else
           puts "#{country_name} cannot win war"
        end
      end

    when 5
      if present_country_flag == 1
        @@countries[country_name].display @@countries[country_name]
      end
 
    when 6
      puts "Enter name of country"
      name = gets.chomp.upcase
      puts "Enter population"
      population = gets.chomp.to_i
      puts "Enter name GDP"
      gdp = gets.chomp.to_f
      puts "Enter no of states in country"
      states = gets.chomp.to_i
      puts "Enter army strength"
      army = gets.chomp.to_i
      flag = 0
      while 1
      puts "Enter state of country\n1.developed\n2. developing\n"
      state_choice = gets.chomp.to_i
        if state_choice == 1
          state = "DEVELOPED"
          flag = 1
          break
        elsif state_choice == 2
          state = "DEVELOPING"
          flag = 1
          break
        else
           puts "Invalid choice"
        end
      end
      if flag == 1
        Country.add_country(name, population, gdp, states, army, state)   
      end
      # country_info = {"name" => name, "population" => population, "GDP" => gdp, "states" => states, "army_strenght" => army, "state" => state}
    when 7
      exit
    end
  end
end 
