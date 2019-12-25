
class Account
  
  attr_accessor :first_account_no, :min_balance, :acc_no, :name, :balance, :type
  
	@@first_account_no = 99
  @@min_balance = 1000

  def initialize(name, amount, type)
     @@first_account_no += 1
     @name = name
     @acc_no = @@first_account_no
     @balance = amount
     @type = type
  end

  def calculate_amount(account, months, rate_of_interest)
  amount = account.balance * rate_of_interest * months / 1200
  end

  def deposit(account, amount)
  	account.balance += amount 
  end

  def withdraw(account, amount)
  	if account.balance - amount < @@min_balance
      return 0
    else
    	account.balance -= amount
      return 1
    end
  end

  def get_balance(account)
  	puts "\nCustomer name: #{account.name}\nAccount no : #{account.acc_no}\nType of account : #{account.type}\nYour current balance is #{account.balance}\n\n"
  end

  def create_account(name, type, amount)
    if amount < @@min_balance
      puts "Please enter amount greater than min_balance"
    else
      if type == ACCOUNT_TYPE_SAVING
        new_account = SavingAccount.new(name, amount)
      elsif type == ACCOUNT_TYPE_CURRENT
        new_account = CurrentAccount.new(name, amount)
      else
        puts "Not valid account type"
      end
      if type == ACCOUNT_TYPE_SAVING or type == ACCOUNT_TYPE_CURRENT
        Accounts[@@first_account_no] = new_account
        puts Accounts
      end
    end
  end
end  

class SavingAccount < Account
	attr_accessor :ROI
  @@ROI = 9.75

	def initialize(name, amount)
    super(name, amount, ACCOUNT_TYPE_SAVING)
    puts "----Your saving account is created----"
	end	

	def calculate_amount(account, months)
    #amount = super.calculate_amount(account, months, @@ROI)
    amount = account.balance * @@ROI * months / 1200
    puts "You will get interest of Rs. #{amount} on balance of Rs. #{account.balance} for period of #{months} months with ROI #{@@ROI}"
	end
end

class CurrentAccount < Account
  attr_accessor :ROI
  @@ROI = 7.25

  def initialize(name, amount)
    super(name, amount, ACCOUNT_TYPE_CURRENT)
    puts "----Your current account is created----"
  end 

  def calculate_amount(account, months)
    #amount = super.calculate_amount(account, months, @@ROI)
    amount = account.balance * @@ROI * months / 1200
    puts "You will get interest of Rs. #{amount} on balance of Rs. #{account.balance} for period of #{months} months with ROI #{@@ROI}"
  end
end

Accounts = Hash.new 
ACCOUNT_TYPE_SAVING = "saving"
ACCOUNT_TYPE_CURRENT = "current"

while 1
  puts "______________________\nEnter your choice\n1.Create account\n2.Withdraw\n3.Deposit\n4.Check balance\n5.check ROI\n6.Exit"
  choice = gets.chomp.to_i
  if choice != 1 and choice <= 5
    puts "Enter account no"
    acc_no = gets.chomp.to_i
    if !Accounts.has_key? acc_no
      puts "Account number does not exist"
      flag = 0
    else
      flag = 1
    end
  end
  
  if flag == 1 or choice == 6 or choice == 1
    case choice
    when 1 
      puts "Enter name of customer"
      name = gets.chomp
      puts "Enter account type(saving or current)"
      type = gets.chomp.downcase
      puts "Enter amount you want to depoist in your account first"
      amount = gets.chomp.to_f
      Account.new("first",0,ACCOUNT_TYPE_SAVING).create_account(name, type, amount)
    when 2
      puts "Enter amount you want to withdraw"
      amount = gets.chomp.to_f
      status=Accounts[acc_no].withdraw(Accounts[acc_no], amount) 
      if status == 1
        puts "Amount is withdrawl"
      else
        puts "You can not withdraw"
      end
    when 3
      puts "Enter amount you want to deposit"
      amount = gets.chomp.to_f
      Accounts[acc_no].deposit(Accounts[acc_no], amount) 
      puts "Amount is deposited"
    when 4
     Accounts[acc_no].get_balance(Accounts[acc_no]) 
    when 5
      puts "Enter no of month "
      months = gets.chomp.to_i
      Accounts[acc_no].calculate_amount(Accounts[acc_no], months) 
    when 6
      exit
    end
end
end