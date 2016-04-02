require_relative 'todolist.rb'

# Creates a new todo list
list = TodoList.new("My ToDo List")
# Add four new items
list.add_item("Do Laundry")
list.add_item("Feed the cat")
list.add_item("Buy cereal")
list.add_item("Go dancinc!")

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
list.title = "My new Title of List"
# Print the list
list.print_list
#CHeck if Item is completed
list.item_completed?(1)
#Remove Completed items
list.remove_completed
# Print the list
list.print_list
#Remove all items
list.remove_all
# Print the list
list.print_list
#puts TodoList.instance_methods
#puts TodoList.instance_method(:remove_item).parameters
list.help
