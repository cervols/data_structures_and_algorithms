# Array Operations and their Big O

strings = ['a', 'b', 'c', 'd']
numbers = [1, 2, 3, 4, 5]

# lookup - O(1)
strings[2] #=> "c"
strings[-1] #=> "d"

# push - O(1)
strings.push('e') #=> ["a", "b", "c", "d", "e"]

# pop - O(1)
strings.pop() #=> "e"
strings.pop() #=> "d"

# push and pop are O(1) because you add and remove only
# from the end. You don't need to readjust the array.

# unshift - O(n)
strings.unshift('x') #=> ["x", "a", "b", "c"]

# shift - O(n)
strings.shift #=> "x"
strings #=> ["a", "b", "c"]

# shift and unshift are O(n) because we add and remove from
# the beginning, and this means all the values that follow
# need to be shifted as well.

# insert - O(n)
strings.insert(1, 'alien')  #=> ["a", "alien", "b", "c"]

# delete - O(n)
strings.delete('alien') #=> 'alien'
strings #=> ["a", "b", "c"]
