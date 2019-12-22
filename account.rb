class Account
 
  attr_reader :acc_no, :name, :balance, :type
	@@first_account_no = 100
  @@min_balance = 1000
  def initialize(name, amount, type)
   	 @@first_account_no += 1
     @name = name
     @acc_no = @@first_account_no
     @balance = amount
     @type = type
  end

  def self.deposit(account_no, amount)
  	account_no[1] += amount
    puts "Amount is deposited"
  end

  def self.withdraw(account_no, amount)
  	if account_no[1] - amount < @@min_balance
  		puts "You can not withdraw"
    else
    	account_no[1] -= amount
    	puts "Amount is withdrawl"
    end
  end

  def self.get_balance(account_no)
  	puts "\nCustomer name: #{account_no[0]}\nType of account : #{account_no[2]}\nYour current balance is #{account_no[1]}\n\n"
  end

  def self.calculate_amount(account_no, months)
    if account_no[2] == "saving"
      SavingAccount.calculate_amount(account_no, months)
    else
      CurrentAccount.calculate_amount(account_no, months)
    end
  end

  def self.create_account(name, type, amount)
  account_info = []
    if amount < @@min_balance
      puts "Please enter amount greater than min_balance"
    else
      if type == "saving"
        new_account = SavingAccount.new(name, amount)

      elsif type == "current"
        new_account = CurrentAccount.new(name, amount)
      else
        puts "Not valid account type"
      end
      if type == "saving" or type == "current"
        account_info << new_account.name
        account_info << new_account.balance
        account_info << new_account.type
        #puts account_info
        Accounts_all[new_account.acc_no] = account_info
      end
    end
  
end


end  

class SavingAccount < Account
	attr_accessor :ROI
  @@ROI = 9.75
	def initialize(name, amount)
    super(name, amount, "saving")
    puts "----Your saving account is created----"
	end	

	def self.calculate_amount(account_no, months)
    amt = account_no[1] * @@ROI * months / 100 
    puts "You will get interest of Rs. #{amt} on balance of Rs. #{account_no[1]} for period of #{months} months with ROI #{@@ROI}"
	end
end

class CurrentAccount < Account
  attr_accessor :ROI
  @@ROI = 7.25
  def initialize(name, amount)
    super(name, amount, "current")
    puts "----Your current account is created----"
  end 

  def self.calculate_amount(account_no, months)
    amt = account_no[1] * @@ROI * months / 1200
    puts "You will get interest of Rs. #{amt} on balance of Rs. #{@balance} for period of #{months} months with ROI #{@@ROI}"
  end
end

Accounts_all = {}
while 1
  puts "Enter your choice\n1.Create account\n2.Withdraw\n3.Deposit\n4.Check balance\n5.check ROI\n6.Exit"
  choice = gets.chomp.to_i
  if choice != 1 and choice <= 5
    puts "Enter account no"
    acc_no = gets.chomp.to_i
  end
  case choice
  when 1 
    puts "Enter name of customer"
    name = gets.chomp
    puts "Enter account type(saving or current)"
    type = gets.chomp.downcase
    puts "Enter amount you want to depoist in your account first"
    amount = gets.chomp.to_f
    Account.create_account(name, type, amount)
    puts Accounts_all
  when 2
    puts "Enter amount you want to withdraw"
    amount = gets.chomp.to_f
    Account.withdraw(Accounts_all[acc_no], amount) 
  when 3
    puts "Enter amount you want to deposite"
    amount = gets.chomp.to_f
    Account.deposit(Accounts_all[acc_no], amount) 
  when 4
   Account.get_balance(Accounts_all[acc_no]) 
  when 5
    puts "Enter no of month "
    months = gets.chomp.to_i
    Account.calculate_amount(Accounts_all[acc_no], months) 
  when 6
    exit
  end
end





