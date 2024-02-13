class Node
  attr_accessor :value, :next, :prev

  def initialize(value)
    @value = value
    @next = nil
    @prev = nil
  end
end

class DoublyLinkedList
  attr_accessor :head, :tail, :length

  def initialize(value)
    @head = Node.new(value)
    @tail = @head
    @length = 1
  end

  def append(value)
    new_node = Node.new(value)
    new_node.prev = tail
    tail.next = new_node
    self.tail = new_node

    self.length += 1
  end

  def prepend(value)
    new_node = Node.new(value)
    new_node.next = head
    head.prev = new_node
    self.head = new_node

    self.length += 1
  end

  def insert(index, value)
    raise ArgumentError, 'Invalid index' if index < 0

    if index == 0
      prepend(value)
    elsif index >= length
      append(value)
    else
      new_node = Node.new(value)
      leader = traverse_to_index(index - 1)
      follower = leader.next
      new_node.prev = leader
      new_node.next = follower
      leader.next = new_node
      follower.prev = new_node

      self.length += 1
    end
  end

  def remove(index)
    raise ArgumentError, 'Invalid index' if index < 0 || index >= length

    if index == 0
      self.head = head.next
      head.prev = nil
    elsif index == length - 1
      leader = traverse_to_index(index - 1)
      leader.next = nil
    else
      leader = traverse_to_index(index - 1)
      unwanted_note = leader.next
      next_note = unwanted_note.next
      leader.next = next_note
      next_note.prev = leader
    end

    self.length -= 1
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
    raise ArgumentError, 'Invalid index' unless index >= 0 && index < length

    current_node = head
    counter = 0

    while counter < index
      current_node = current_node.next
      counter += 1
    end

    current_node
  end
end


linked_list = DoublyLinkedList.new(5)

linked_list.append(7)
linked_list.prepend(2)
linked_list.print_list  #=> [2, 5, 7]

linked_list.insert(10, 1)
linked_list.print_list  #=> [2, 5, 7, 1]

linked_list.remove(0)
linked_list.print_list  #=> [5, 7, 1]
