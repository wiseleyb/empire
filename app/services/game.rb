class Game
  attr_accessor :settings, :map

  SETTING_DEFAULTS = {
    height: 50,
    scale: 6.0,
    seed: rand(100_000),
    width: 50
  }

  # settings
  #   height: height of map
  #   scale: scale used in Perlin (does stuff like size lakes, mountains)
  #   seed: rand seed for map gen, allows you to recreate maps
  #   width: width of map
  def initialize(settings = {})
    @settings = settings.reverse_merge(SETTING_DEFAULTS)
    @map = Map.new(self)
  end

  def print
    puts "w: #{settings[:width]} h: #{settings[:height]} "\
         "scale:#{settings[:scale]} seed: #{settings[:seed]}"
    map.map.each { |row| puts row.join(' ') }
    nil
  end

  def self.test(settings = {})
    Game.new(settings).print
  end
end
