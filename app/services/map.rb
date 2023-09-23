class Map
  attr_accessor :map

  def initialize(game)
    @map = build_map(game)
  end

  def build_map(game)
    perlin = Perlin::Noise.new(2, seed: game.settings[:seed])
    map = Array.new(game.settings[:width]) { Array.new(game.settings[:height]) }
    scale = game.settings[:scale]

    game.settings[:height].times do |y|
      game.settings[:width].times do |x|
        value = perlin[x.to_f / scale, y.to_f / scale]
        map[x][y] = terrain(value)
      end
    end
    map
  end

  def terrain(perlin_value)
    v = perlin_value
    case
    when v < 0.4
      'o'.blue
    when v < 0.65
      '.'.green
    else
      'm'.grey
    end
  end
end
