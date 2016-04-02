class TodoList
     # Initialize todo list with a title and no items
     def initialize(list_title)
        @title = list_title
        @items = Array.new # Starts empty! No Items yet!
     end

     attr_reader :items
     attr_accessor :title

     # Creates a new Item and adds it to the array of Items
    def add_item(new_item)
        item = Item.new(new_item)
        @items.push(item)
    end

    # Update the Completed status af an item based on the index
    def update_completed_status(index)
        @items.at(index-1).update_completed_status
    end

    #Remove item at an index
    def remove_item(index)
        @items.delete_at(index-1)
    end

    #Print the completed status of the item
    def item_completed?(index)
        puts @items.at(index-1).completed_status
    end

    #Print the list, with title and all items and their completed status
    def print_list
        puts "-------------"
        puts @title
        puts "-------------"
        if !@items.empty?
            longest_item_length = @items.max_by{ |x| x.description.length }.description.length
            @items.each do |item|
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
    def initialize(description)
        @description = description
        @completed_status = false
    end

    def update_completed_status
        @completed_status = !@completed_status
    end

    def print_item(item_number, white_space_length)
        sprintf "#{item_number}  - %-#{white_space_length}s  Completed: %s\n", @description, @completed_status
    end



end
