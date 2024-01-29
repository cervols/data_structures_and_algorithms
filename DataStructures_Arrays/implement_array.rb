class MyArray
  attr_accessor :length, :data

  def initialize
    @length = 0
    @data = {}
  end

  def get(index)
    data[index]
  end

  def push(item)
    data[length] = item
    self.length += 1
  end

  def pop
    last_item = data[length - 1]
    data.delete(length - 1)
    self.length -= 1

    last_item
  end

  def delete_at(index)
    item = data[index]
    shift_items(index)

    item
  end

  private

    def shift_items(index)
      for i in (index...(length - 1))
        data[i] = data[i + 1]
      end

      data.delete(length - 1)
      self.length -= 1
    end
end


arr = MyArray.new

arr.push('I') #=> 1
arr.push('am')  #=> 2
arr.push('amazing') #=> 3
arr.push('!') #=> 4

arr.get(1)  #=> "am"

arr.pop #=> "!"

arr.delete_at(1)  #=> "am"

arr  #=> #<MyArray: @data={0=>"I", 1=>"amazing"}, @length=2>
