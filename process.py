log_file = open("um-server-01.txt")
# this opens the text file "um-server-01.txt so that we can work on the txt filr"

def sales_reports(log_file): # defining a function 'sales_report' with log file as a argument name
    for line in log_file: # line is a variable that does the loop
        line = line.rstrip() #removes the trailing whitespaces if the argument is not provided
        day = line[0:3]
        if day == "Tue": # if query we are assigning the value of day column to be 'tue' as a condition
            print(line) # only prints results that meets the condition stated above that is it prints all the 'tue' data


sales_reports(log_file)


log_file = open("um-server-01.txt")


def sales_reports(log_file): 
    for line in log_file: 
        line = line.rstrip() 
        day = line[0:3]
        if day == "Wed": 
            print(line) 


sales_reports(log_file)