class FoodOrder
	@@Menu = ["ROTI", "RICE", "PANJABI THALI", "GUJARATHI THALI", "DOSA", "PIZZA", "PASTA"]
	
	def initialize(order, name)
		@name=name
    @order = order
    confirm
  end

	def self.show_menu
		puts "-----Menu-----"
			for i in 0..@@Menu.length do
				puts @@Menu[i]
			end
	end

	def confirm
		flag = 1
		for i in 0..@order.length-1 do
		
			if (!@@Menu.include? @order[i])
				puts "item is not avaliable now"
				flag = 0
				break;
			end
		end
		if flag == 1
			sleep(3)
			puts "----Your order is confirmed----"
			deliver
		else
			sleep(3)
			puts "----Your order is not confirmed----"
		end
	end

	def deliver
		sleep(5)
		puts "----Your order is deliver----"
	end

end


for i in 0..1 do
 puts "Enter customer name"
 name = gets.chomp
	order_list = []
	while(1)
		FoodOrder.show_menu
		puts "Enter your order"
		order = gets.chomp.upcase
		order_list.push(order)
			
		puts "\nPress any key to continue\nPress n to stop\n\n"
		key = gets.chomp
		if key == "n"
			puts "Your order is:"
			for i in 0..order_list.length do
				puts order_list[i]
			end
			puts "---Your order is accepted----"
			break;
		end
	end
	customer = FoodOrder.new(order_list,name)
end	