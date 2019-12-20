class Account
 
  attr_reader :acc_no,:name,:amount,:type

	@@count = 100
  def initialize(n, amount, type)
   	 @@count += 1
     @name = n
     @acc_no = @@count
     @balance = amount
     @type = type
  end

  def deposite
  	puts "Enter amount you want to deposite"
  	amount = gets.chomp.to_f
  	@balance += amount
    puts "Amount is deposited"
  end

  def withdraw
  	puts "Enter amount you want to withdraw"
  	amount = gets.chomp.to_f
  	if @balance - amount < 1000
  		puts "You can not withdraw"
    else
    	@balance -= amount
    	puts "Amount is withdrawl"
    end
  end

  def get_balance
  	puts "\nCustomer name: #{@name}\nAccount no : #{@acc_no}\nYour current balance is #{@balance}\n\n"
  end

end  


class SavingAccount < Account
	attr_accessor :ROI
	def initialize(name, amount)
    super(name, amount, type)
	  @@ROI = 9.75
    puts "----Your saving account is created----"
    get_balance
	end	

	def calc_amount()
    puts "Enter no of month "
    months = gets.chomp.to_i
    amt = @balance * @@ROI * months / 1200
    puts "You will get interest of Rs. #{amt} on balance of Rs. #{@balance} for period of #{months} months with ROI #{@@ROI}"
	end

end



class CurrentAccount < Account
  attr_accessor :ROI
  def initialize(name, amount)
    super(name, amount, type)
    @@ROI = 7.25
    puts "----Your current account is created----"
    get_balance
  end 

  def calc_amount()
    puts "Enter no of month "
    months = gets.chomp.to_i
    amt = @balance * @@ROI * months / 1200
    puts "You will get interest of Rs. #{amt} on balance of Rs. #{@balance} for period of #{months} months with ROI #{@@ROI}"
  end
end

def create_account
  puts "Enter name of customer"
  name = gets.chomp
  puts "Enter account type(saving or current)"
  type = gets.chomp.downcase
  while(1)
    puts "Enter amount you want to depoist in your account first"
    amount = gets.chomp.to_f
    if amount >= 1000
      if type == "saving"
        new_account = SavingAccount.new(name, amount)
        Account_all << new_account

      elsif type == "current"
        new_account = CurrentAccount.new(name, amount)
        Account_all << new_account

      else
        puts "Not valid account type"
      end

      break
    else
      puts "Please enter amount greater than min_balance"
    end
  end
end 


Account_all = []
while 1
  puts "Enter your choice\n1.Create account\n2.Withdraw\n3.Deposite\n4.Check balance\n5.check ROI\n6.Exit"
  choice = gets.chomp.to_i
  case choice
  when 1 
    create_account
    puts Account_all
    
  when 2
    puts "Enter account no"
    acc_no = gets.chomp.to_i
    Account_all.each do |i|
      if i.acc_no == acc_no
        i.withdraw
      end
    end

  when 3
     puts "Enter account no"
    acc_no = gets.chomp.to_i
    Account_all.each do |i|
      if i.acc_no == acc_no
        i.deposite
      end
    end


  when 4
    puts "Enter account no"
    acc_no = gets.chomp.to_i
    Account_all.each do |i|
      if i.acc_no == acc_no
        i.get_balance
      end
    end


  when 5
    puts "Enter account no"
    acc_no = gets.chomp.to_i
    Account_all.each do |i|
      if i.acc_no == acc_no
        i.calc_amount
      end
    end

  when 6
    exit
  end
end





