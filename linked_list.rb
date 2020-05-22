class LinkedList
    attr_accessor :head, :tail
    def append(node)
        unless @head
            @head = node
        else
            curr_node = @head
            curr_node = curr_node.next_node until curr_node.next_node == nil
            curr_node.next_node = node
        end
    end

    def prepend(node)
        node.next_node = @head
        @head = node
    end

    def size
        count = 0
        curr_node = @head
        while curr_node
            count += 1
            curr_node = curr_node.next_node
        end
        count
    end

    def tail
        curr_node = @head
        curr_node = curr_node.next_node until curr_node.next_node == nil
        curr_node
    end

    def at(index)
        curr_node = @head
        index.times { curr_node ? curr_node = curr_node.next_node : break }
        curr_node ? curr_node : "NOT FOUND"
    end

    def pop
        curr_node = @head
        curr_node = curr_node.next_node until curr_node.next_node.next_node == nil
        curr_node.next_node = nil
    end

    def contains?(value)
        curr_node = @head
        until curr_node == nil
            return true if curr_node.value == value
            curr_node = curr_node.next_node
        end
        return false
    end

    def find(value)
        curr_node = @head
        index = 0
        until curr_node == nil
            return index if curr_node.value == value
            curr_node = curr_node.next_node
            index += 1
        end
        return false
    end

    def to_s
        curr_node = @head
        until curr_node == nil
            print curr_node.next_node ? "(#{curr_node.value}) -> " : "(#{curr_node.value}) -> nil\n" 
            curr_node = curr_node.next_node
        end
    end

    def insert_at(node, index)
        curr_node = @head
        if index > size
            append(node)
        elsif index > 0
            (index-1).times { curr_node = curr_node.next_node }
            node.next_node = curr_node.next_node
            curr_node.next_node = node
        else
            prepend(node)
        end
    end

    def remove_at(index)
        curr_node = @head
        if index > size
            puts "No node in that index"
            return
        elsif index > 0
            (index-1).times { curr_node = curr_node.next_node }
            curr_node.next_node = curr_node.next_node.next_node
        else
            @head = @head.next_node
        end
    end
end

class Node
    attr_accessor :value, :next_node
    def initialize(value = nil, next_node = nil)
        @value = value
        @next_node = next_node
    end
end

def show_menu
    puts %{
        ---------------------------
        |      CHOOSE OPTION      |
        --------------------------|
        |1. Display List          |
        |2. Append Node           |
        |3. Prepend Node          |
        |4. Pop Node              |
        |5. Print List Size       |
        |6. Find Value            |
        |7. Print Value At        |
        |8. Check If List Contains|
        |9. Print List Tail Value |
        |0. QUIT                  |
        ---------------------------
    }
end

linked_list = LinkedList.new()

while true
    show_menu
    choice = gets.chomp.to_i
    case choice
    when 1
        linked_list.to_s
    when 2
        print "Enter Value: "
        linked_list.append(Node.new(gets.chomp))
    when 3
        print "Enter Value: "
        linked_list.prepend(Node.new(gets.chomp))
    when 4
        linked_list.pop
    when 5
        puts linked_list.size
    when 6
        print "What would you like to find? "
        puts linked_list.find(gets.chomp)
    when 7
        print "Enter Index: "
        puts linked_list.at(gets.chomp.to_i)
    when 8
        print "Enter Value: "
        puts linked_list.contains?(gets.chomp) ? "List Contains That Value!" : "Couldn't Find That Value"
    when 9
        puts linked_list.tail.value
    when 0
        break
    else
        puts "Invalid Input. Try Again."
    end
    puts "Press Enter to Continue."
    gets.chomp
end
