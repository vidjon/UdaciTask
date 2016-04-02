require_relative 'todolist.rb'

# Creates a new todo list
list = TodoList.new("My ToDo List")
#Write out help
list.help
# Add four new items
list.add_item("Do Laundry")
list.add_item("Feed the cat")
list.add_item("Buy cereal")
list.add_item("Go dancing!")
list.add_item("Clean Car!", "2016-04-26")
list.add_item("Learn more RUBY", "2016-05-01")

# Print the list
list.print_list
# Delete the first item
list.remove_item(1)
# Print the list
list.print_list
# Delete the second item
list.remove_item(2)
# Print the list
list.print_list
# Update the completion status of the first item to complete
list.update_completed_status(1)
# Print the list
list.print_list
# Update the title of the list
list.title_name("My new Title of List")
# Print the list
list.print_list
#CHeck if Item is completed
list.item_completed?(1)
#Remove Completed items
list.remove_completed_items
# Print the list
list.print_list
# Print the list
list.print_list
#Add multiple items
list.add_multiple_items(
{:description => "Buy food for dinner", :due_date =>  "tonight"},
{:description => "Visit parents", :due_date =>  "2016-05-05"},
{:description => "Buy clothes"})
#Print the list
list.print_list
