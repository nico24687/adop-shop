class Cart
  attr_reader :contents

  def initialize(contents)
    @contents = contents || Hash.new(0)
  end

  def total_count
    contents.values.sum
  end

  def add_dog(id)
    if contents[id.to_s] == nil
      contents[id.to_s] = 0
    end
    contents[id.to_s] += 1
  end

  def remove_dog(id)
    contents.delete(id.to_s)
    contents
  end

  def count_of(id)
    contents[id.to_s]
  end

  def total_price
    contents.map do |dog_id, quantity|
      find_dog(dog_id).price * quantity
    end.sum
  end

  def find_dog(id)
    Dog.find(id)
  end



end
