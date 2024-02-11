# //Google Question
# //Given an array = [2,5,1,2,3,5,1,2,4]:
# //It should return 2

# //Given an array = [2,1,1,2,3,5,1,2,4]:
# //It should return 1

# //Given an array = [2,3,4,5]:
# //It should return undefined


def first_recurring_character(input)
  return unless input.is_a?(Array)

  set = Set.new

  input.each do |item|
    return item if set.include?(item)

    set.add(item)
  end

  nil
end


arr1 = [2, 5, 1, 2, 3, 5, 1, 2, 4]
arr2 = [2, 1, 1, 2, 3, 5, 1, 2, 4]
arr3 = [2, 3, 4, 5]

first_recurring_character(arr1) #=> 2
first_recurring_character(arr2) #=> 1
first_recurring_character(arr3) #=> nil
