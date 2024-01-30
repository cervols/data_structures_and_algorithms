# Create a function that reverse a string:
# 'Hi there' should be:
# 'ereht iH'

def reverse(str)
  return 'Invalid input data' unless str.is_a?(String)
  return str if str.length < 2

  backwards = []
  index = str.length - 1

  while index >= 0
    backwards.push(str[index])
    index -= 1
  end

  backwards.join
end


str = 'Hi there'

reverse(str)  #=> "ereht iH"
