class HashTable
  attr_reader :data

  def initialize(size)
    @data = Array.new(size)
  end

  def set(key, value)
    address = hash(key)

    if data[address].nil?
      data[address] = []
    end
    data[address].push([key, value])

    data
  end

  def get(key)
    address = hash(key)
    current_bucket = data[address]

    return unless current_bucket

    target_bucket = current_bucket.find do |inner_bucket|
      inner_bucket.first == key
    end

    target_bucket&.last
  end

  def keys
    keys = []

    data.each do |bucket|
      next unless bucket

      bucket.each do |inner_bucket|
        keys.push(inner_bucket.first)
      end
    end

    keys
  end

  private

    # Our custom hash function
    def hash(key)
      hash = 0

      key.length.times do |i|
        hash = (hash + key[i].ord * i) % data.length
      end

      hash
    end
end


hash_table = HashTable.new(3)  #=> #<HashTable: @data=[nil, nil, nil]>

hash_table.set('grapes', 10000)  #=> [[["grapes", 10000]], nil, nil]
hash_table.set('apples', 9)  #=> [[["grapes", 10000]], [["apples", 9]], nil]
hash_table.set('orange', 3)  #=> [[["grapes", 10000]], [["apples", 9], ["orange", 3]], nil]

hash_table.get('apples') #=> 9

hash_table.keys  #=> ["grapes", "apples", "orange"]
