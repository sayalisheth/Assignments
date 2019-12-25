class FoodOrder
	@@Menu = {"ROTI"=>25, "RICE"=>100, "PANJABI THALI"=>150, "GUJARATHI THALI"=>160, "DOSA"=>100, "PIZZA"=>250, "PASTA"=>200}
	@@food_orders = {}
	def initialize(name, orders)
		@@food_orders[name]=orders
    confirm_food_oder
  end

  def self.accept_food_oder
  	puts "Enter customer name"
	  name = gets.chomp
		order_list = {}
		bill = 0
			while 1
				FoodOrder.show_menu
				puts "\nPress any key to continue\nPress n to stop\n\n"
				key = gets.chomp
				if key != 'n'
					puts "Enter your order"
					order = gets.chomp.upcase
					if @@Menu.has_key?order
						puts order
						order_list[order] = @@Menu[order]
						puts order_list
					else 
						puts "Item is not avaliable"
					end	
				else
					order_list.each do |order|
						bill += order[1]
					end
					if bill == 0
						puts "You do not order anything"
						break
					else
						puts "Your order is:"
						puts order_list
						puts "---Your order is accepted----\n You have to pay Rs #{bill}"
						customer = FoodOrder.new(name, order_list)
						break
					end
				end
			end
	  
  end

	def self.show_menu
		puts "-----Menu-----"
				puts @@Menu
	end

	def confirm_food_oder
		sleep(3)
		puts "----Your order is not confirmed----"
		deliver_food_oder
	end

	def deliver_food_oder
		sleep(5)
		puts "----Your order is deliver----"
		puts "\n#{@@food_orders}\n"
	end
end

while 1
	puts "-------------------------\nYou want to order food?\nIf YES press y or if NO press n"
	choice = gets.chomp.upcase
	if choice == "Y"
		FoodOrder.accept_food_oder
	elsif choice == "N"
		exit
	else
		puts "Invalid choice"
	end
end