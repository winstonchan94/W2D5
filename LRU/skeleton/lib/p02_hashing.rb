class Fixnum
  # Fixnum#hash already implemented for you

end

class Array
  def hash
    return 69 if self.flatten == []
    self.reduce do |acc, el|
      acc.hash % el.hash
    end
  end
end

class String
  def hash
    return 420 if self.empty?
    self.chars.reduce do |acc, el|
      acc.ord % el.ord
    end
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    return 0 if self.empty?
    init_acc = 12345123213123432432451233123
    self.keys.reduce(init_acc) do |acc, el|
      acc + (el.hash % self[el].class.hash)
    end


  end
end
