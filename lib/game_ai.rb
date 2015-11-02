class GameAI
  def self.create_value
    ans = ''
    1.times do
      ans += self.create_int.to_s + ',' + self.create_int.to_s
      ans += ',' + self.create_int.to_s + ',' + self.create_int.to_s
    end
    return [{name: 'v', value: ans}]
  end
  def self.create_int
    return rand(1000)
  end
end