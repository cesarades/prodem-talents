##################################
#####    Seed The Program    #####
##################################
puts "---------------------------------------------"
puts "Cleaning database..."
User.delete_all
Meeting.delete_all
puts "Databse cleaned"
puts "---------------------------------------------"
