class GameAI
  def self.create_value
    ans = ''
    50.times do
      case rand(4)
        when 0
          ans += 'A'
        when 1
          ans += 'B'
        when 2
          ans += 'C'
        when 3
          ans += 'D'
      end
    end
    return [{name: 'str', value: ans}]
  end
end