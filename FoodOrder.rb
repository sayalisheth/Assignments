class FoodOrder
	@@Menu=["roti","rice","panjabi thali","Gujarathi thali","Dosa","pizza"]
	
	def initialize(order)
     @order=order
     confirm
   end

	def self.show_menu
		puts "-----Menu-----"
			for i in 0..@@Menu.length do
					puts @@Menu[i]
			end
	end

	def confirm
		f=1
		for i in 0..@order.length-1 do
			#puts @order[i]
		if (!@@Menu.include? @order[i])
				puts "item is not avaliable now"
				f=0
				break;
		end
		end
		if f==1
			puts "----Your order is confirmed----"
			deliver
		else
			puts "----Your order is not confirmed----"
		end
	end

	def deliver
		for i in 1..10
			puts "."
		end
		puts "----Your order is deliver----"
	end

end



ord=[]
while(1)
			FoodOrder.show_menu
			puts "Enter your order"
			o=gets.chomp
			ord.push(o)
			
			puts "\nPress any key to continue\nPress n to stop\n\n"
			char=gets.chomp

			if char=="n"
				puts "Your order is:"
				for i in 0..ord.length do
					puts ord[i]
				end
				puts "---Your order is accepted----"
				break;
			end

	end
	

o1=FoodOrder.new(ord)
