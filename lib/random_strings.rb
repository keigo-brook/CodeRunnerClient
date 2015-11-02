class RandomStrings
  def self.random_value
    ans = ''
    40000.times do
      ans += create_int + ',' + create_int
    end
    return [{name: 'v', value: ans}]
  end

  def create_int
    return rand(40000)
  end
end