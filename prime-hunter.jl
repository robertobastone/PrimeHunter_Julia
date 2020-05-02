
######################### Prime Hunter (Julia)
# about me
author = "Roberto Bastone"

# about the script
version = "1.04"
pyPlotScriptVersion = v"2.8.2"
# packages needed
using Pkg
using PyPlot
using Dates
pkgs = Pkg.installed();

yes = ["Yes","yes","YES","Y","y"]
no = ["No","no","NO","N","n"]

primenumbers_array =[]
execution_time_array =[]

# code

function main()
	primenumbers_array =[]
	execution_time_array =[]
	keepOnHunting = true
	if checkPackages()
		introduction()
		while keepOnHunting == true
			hunter()
		        keepOnHunting = doYouWishToContinue()
		end
		plottingPNvsET()
		sayingGoodbye()
	else
		printstyled("Packages requirements not satisfied. Check \"Requirements\" section in README",color=:red)
	end
end

function checkPackages()
	pyplotVersion = pkgs["PyPlot"]
	if (pyplotVersion ===  pyPlotScriptVersion)
		return true
	else
		return false
	end
end

function introduction()
	printstyled("Welcome to the prime Hunter version $version. \n",color=:blue)
	printstyled("(Author: $author) \n",color=:blue)
end

function hunter()
	div = 2

	while true
		#try
			printstyled("Type an integer, the hunter will tell whether it is a prime number.\n",color=:blue)
			numInput = readline()
			num = parse(Int64,numInput)
			start_time = Dates.Time(Dates.now())
			while   num % div != 0
				div +=  1
			end
			if   num  == div
				execution_time = Dates.Time(Dates.now()) - start_time
				execution_time_millisecond = convert(Dates.Millisecond, execution_time)
				println("The Hunter says that ", num, " is prime (hunting time: ", execution_time_millisecond ,").\n")
				push!(primenumbers_array,num)
				push!(execution_time_array,execution_time_millisecond.value)
			else
				execution_time = Dates.Time(Dates.now()) - start_time
				execution_time_millisecond = convert(Dates.Millisecond, execution_time)
				println("The Hunter says that ", div, " is the divisor of ", num, " (hunting time: ", execution_time_millisecond ,").\n")
			end
			break
		#catch
		#	printstyled("This is not an integer. \n",color=:red)
		#	continue
		#end
	end
end

function doYouWishToContinue()
	while true
		printstyled("Do you wish to continue? [y/n] ",color=:blue)
		choice = readline()
		if any(x->x==choice, yes)
			return true
		elseif any(x->x==choice, no)
			if !isempty(primenumbers_array) && !isempty(execution_time_array)
				println("Prime numbers found: ",primenumbers_array)
				println("Execution time: ",execution_time_array)
				#printstyled("Do you wish to continue? [y/n] ",color=:blue)
			end
			return false
		else
			printstyled("Invalid input. \n",color=:yellow)
			continue
		end
	end
end

function plottingPNvsET()
	if !isempty(primenumbers_array) && !isempty(execution_time_array)
		plotColor = "red"
		plotLineWidth = 2.0
		plotLineStyle = "--"
		scatter(execution_time_array,primenumbers_array)
	    plot(execution_time_array, primenumbers_array, color=plotColor, linewidth=plotLineWidth, linestyle=plotLineStyle)
		title("Prime Number vs Execution Time")
		xlabel("Execution Time (milliseconds)")
		ylabel("Prime Number")
	end
end

function sayingGoodbye()
	printstyled("Terminating... Prime Hunter " * string(version) *"\n",color=:blue)
	printstyled("If you find any bug, please do not hesitate to contact me at " * email * "\n",color=:blue)
end
