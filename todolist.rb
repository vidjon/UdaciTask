class TodoList
     # Initialize todo list with a title and no items
     def initialize(list_title)
        puts "Todo List created - use method help to get information on methods for Todo list"
        @title = list_title
        @items = Array.new # Starts empty! No Items yet!
     end

     #attr_accessor :title

     # Creates a new Item and adds it to the array of Items
    def add_item(description, due_date = "none")
        item = Item.new(description, due_date)
        @items.push(item)
    end

    def add_multiple_items(*item_hashes)
        if !item_hashes.empty?
            item_hashes.each do |item|
                if item.key?(:description) && !item.key?(:due_date)
                    add_item(item[:description])
                elsif item.key?(:description)
                    add_item(item[:description], item[:due_date])
                end
            end
        end
    end


    def title_name(title_name)
        @title = title_name
    end

    # Update the Completed status af an item based on the index
    def update_completed_status(item_position)
        @items.at(item_position-1).update_completed_status
    end

    #Remove item at an index
    def remove_item(item_position)
        @items.delete_at(item_position-1)
    end

    #Print the completed status of the item
    def item_completed?(item_position)
        puts @items.at(item_position-1).completed_status
    end

    #Remove Completed Item
    def remove_completed_items
        @items = @items.select { |e| !e.completed_status }
    end

    #Help Function, write out all methods and their parameters
    def help
        todolist_methods = TodoList.instance_methods(false).sort
        todolist_methods.each do |variable|
            puts "----------------------"
            puts "Method: #{variable}; Parameters: #{TodoList.instance_method(variable).parameters.join(", ")}"
        end

    end


    #Print the list, with title and all items and their completed status
    def print_list(include_finished_item = true)
        puts "-------------"
        puts @title
        puts "-------------"
        if !@items.empty?
            print_array = include_finished_item ? @items : @items.select { |e| !e.completed_status  }
            longest_item_length = print_array.max_by{ |x| x.description.length }.description.length
            print_array.each do |item|
                puts item.print_item(@items.index(item)+1, longest_item_length)
            end
        else
            puts "-- Nothing todo! --"
        end
    end
end

class Item
    # methods and stuff go here
    attr_accessor :description, :completed_status

    # Initialize item with a description and marked as
     # not complete
    def initialize(description, due_date)
        @description = description
        @completed_status = false
        @due_date = due_date
    end

    def update_completed_status
        @completed_status = !@completed_status
    end

    def print_item(item_number, white_space_length)
        sprintf "#{item_number}  - %-#{white_space_length}s  Completed: %s\tDue Date: %s \n", @description, @completed_status, @due_date
    end



end
