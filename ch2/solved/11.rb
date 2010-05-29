class BeerSong
  
  attr_accessor :beers
  
  def initialize(beers)
    beers = 0  if beers < 0
    beers = 99 if beers > 99
    self.beers = if beers
  end
  
  def print_song
    beers.downto 1 do |i|
      puts stanza(i)
    end
  end
  
  def stanza(n)
    if n.zero?
      String.new
    else
      "#{translate n} #{bottle n} of beer on the wall,"       "\n"\
      "#{translate n} #{bottle n} of beer,"                   "\n"\
      "Take one down, pass it around,"                        "\n"\
      "#{translate n - 1} #{bottle n-1} of beer on the wall."
    end
  end

  # returns "bottle" or "bottles"
  def bottle(n)
    if n == 1 then 'bottle' else 'bottles' end
  end

  # translates number to English
  def translate(n)
    if 0 <= n && n <= 19
      %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)[n]
    elsif n % 10 == 0
      %w(zero ten twenty thirty forty fifty sixty seventy eighty ninety)[n/10]
    else
      "#{translate n/10*10}-#{translate n%10}".downcase
    end.capitalize
  end
  
end
