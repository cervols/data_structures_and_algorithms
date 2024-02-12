class Node
  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next = nil
  end
end

class LinkedList
  attr_reader :head, :tail, :length

  def initialize(value)
    @head = Node.new(value)
    @tail = @head
    @length = 1
  end

  def append(value)
    new_node = Node.new(value)
    tail.next = new_node
    @tail = new_node

    @length += 1
  end

  def prepend(value)
    new_node = Node.new(value)
    new_node.next = head
    @head = new_node

    @length += 1
  end

  def insert(index, value)
    raise ArgumentError, 'Invalid index' if index < 0

    if index == 0
      prepend(value)
    elsif index >= length
      append(value)
    else
      leader = traverse_to_index(index - 1)
      new_node = Node.new(value)
      new_node.next = leader.next
      leader.next = new_node
      @length += 1
    end
  end

  def remove(index)
    raise ArgumentError, 'Invalid index' if index < 0 || index >= length

    if index == 0
      @head = head.next
    else
      leader = traverse_to_index(index - 1)
      unwanted_note = leader.next
      leader.next = unwanted_note.next
    end

    @length -= 1
  end

  def reverse
    reversed_list = self.class.new(head.value)
    current_node = head.next

    while current_node
      reversed_list.prepend(current_node.value)
      current_node = current_node.next
    end

    reversed_list
  end

  def reverse!
    return self unless head.next

    first = head
    second = first.next

    @tail = head
    tail.next = nil

    while second
      temp = second.next

      second.next = first
      first = second
      second = temp
    end

    @head = first

    self
  end

  def print_list
    array = []
    current_node = head

    while current_node
      array << current_node.value
      current_node = current_node.next
    end

    array
  end

  private

  def traverse_to_index(index)
    raise ArgumentError, 'Invalid index' if index < 0 || index >= length

    current_node = head
    counter = 0

    while counter < index
      current_node = current_node.next
      counter += 1
    end

    current_node
  end
end


linked_list = LinkedList.new(10)

linked_list.append(5)
linked_list.append(16)
linked_list.prepend(1)
linked_list.print_list  #=> [1, 10, 5, 16]

linked_list.insert(2, 99)
linked_list.print_list  #=> [1, 10, 99, 5, 16]
linked_list.insert(20, 88)
linked_list.insert(0, 0)
linked_list.print_list  #=> [0, 1, 10, 99, 5, 16, 88]

linked_list.remove(2)
linked_list.print_list  #=> [0, 1, 99, 5, 16, 88]

linked_list.reverse.print_list  #=> [88, 16, 5, 99, 1, 0]
linked_list.print_list  #=> [0, 1, 99, 5, 16, 88]

linked_list.reverse!
linked_list.print_list  #=> [88, 16, 5, 99, 1, 0]
