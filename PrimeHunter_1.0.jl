######################### Prime Hunter (Julia)

# author: Roberto Bastone
# email: robertobastone93@gmail.com


# code

println("Welcome to the prime Hunter")
println("Type an integer, the hunter will tell whether it is a prime number.\n")

num = readline()
div = 2

while   parse(Int64,num) % div != 0  
	global div +=  1
end
if   parse(Int64,num)  == div
	println("The Hunter says that ", num, " is prime")
else 
	println("The Hunter says that ", div, " is the divisor of ", num)
end

