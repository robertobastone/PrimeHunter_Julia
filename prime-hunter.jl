
######################### Prime Hunter (Julia)

author = "Roberto Bastone"
email = "robertobastone93@gmail.com"
version = "1.01"

yes = ["Yes","yes","YES","Y","y"]
no = ["No","no","NO","N","n"]

# code

function main()
	keepOnHunting = true
	introduction()
	while keepOnHunting == true
		hunter()
	        keepOnHunting = doYouWishToContinue()
	end
	sayingGoodbye()
end

function introduction()
	printstyled("Welcome to the prime Hunter version $version. \n",color=:blue)
	printstyled("(Author: $author) \n",color=:blue)
	printstyled("For info - or anything else - please, feel free to reach me at $email.\n",color=:blue)
end

function hunter()
	div = 2
	while true
		try
			printstyled("Type an integer, the hunter will tell whether it is a prime number.\n",color=:blue)
			num = readline()

			while   parse(Int64,num) % div != 0  
				div +=  1
			end
			if   parse(Int64,num)  == div
				println("The Hunter says that ", num, " is prime. \n")
			else 
				println("The Hunter says that ", div, " is the divisor of ", num, ".\n")
			end
			break
		catch
			printstyled("This is not an integer. \n",color=:red)
			continue	
		end
	end
end

function doYouWishToContinue()
	while true
		printstyled("Do you wish to continue? [y/n] ",color=:blue)
		choice = readline()
		if any(x->x==choice, yes)
			return true
		elseif any(x->x==choice, no)
			return false
		else
			printstyled("Invalid input. \n",color=:yellow)
			continue
		end
	end
end

function sayingGoodbye()
	printstyled("Terminating... Prime Hunter " * string(version) *"\n",color=:blue)
	printstyled("If you find any bug, please do not hesitate to contact me at " * email * "\n",color=:blue)
end
