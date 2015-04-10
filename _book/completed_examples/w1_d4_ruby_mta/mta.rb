#This is the Subway Stops Calculator

mta_lines = {
 n: ["Times Square","34th", "28th", "23rd", "Union Square", "8th"],
 s: ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Palace"],
 l: ["8th", "6th", "Union Square", "3rd", "1st"]
}

def get_lines(information)
 puts information
 puts "Which line, n, l or s ?"
 gets().chomp
end

def get_stop(information)
 puts information
 puts "Which Station?"
 gets().chomp
end

def get_distance(line, first_stop, last_stop)
 (mta_lines[line.to_sym].index(first_stop) - mta_lines[line.to_sym].index(last_stop)).abs
end

#That' everything defined, now start the execution of code.
# First Gather Info
on_line = get_lines("Enter your Getting On Line")
puts "You chose to get on the #{on_line} line"

on_stop = get_stop("Enter Your on Station")
puts "You chose to get on the #{on_stop} Station"

off_line = get_lines("Enter your getting off line")
puts "You chose to get off the #{off_line} line"

off_stop = get_stop("Enter Your off Station")
puts "You chose to get off the #{off_stop} Station"

# calculations
distance =if (on_line == off_line) #  if the stations are on the same line
 get_distance(on_line, on_stop, off_stop)
else # second case is for stops on different lines
 get_distance(on_line, on_stop, "Union Square") + get_distance(off_line, off_stop, "Union Square")    
end
puts "Your Journey Distance is #{distance} Stops"