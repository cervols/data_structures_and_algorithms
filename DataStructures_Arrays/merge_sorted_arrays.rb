def merge_sorted_arrays(arr1, arr2)
  return 'invalid input' unless valid_input?(arr1, arr2)
  return arr1 if arr2.empty?
  return arr2 if arr1.empty?

  merged_arr = []
  i = j = 0

  while arr1[i] || arr2[j]
    if arr2[j].nil? || (arr1[i] && arr1[i] < arr2[j])
      merged_arr.push(arr1[i])
      i += 1
    else
      merged_arr.push(arr2[j])
      j += 1
    end
  end

  merged_arr
end

def valid_input?(arr1, arr2)
  return false unless arr1.is_a?(Array) && arr2.is_a?(Array)
  return false unless arr1.all? { |item| item.is_a?(Numeric) }
  return false unless arr2.all? { |item| item.is_a?(Numeric) }

  true
end

arr1 = [0, 3, 4, 31]
arr2 = [4, 6, 30]
p merge_sorted_arrays(arr1, arr2) #=> [0, 3, 4, 4, 6, 30, 31]
