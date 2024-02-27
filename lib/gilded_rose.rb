module GildedRose
  def self.new(name, days_remaining, quality)
    klass_for(name).new(quality, days_remaining)
  end

  class Normal
    attr_reader :quality, :days_remaining

    def initialize(quality, days_remaining)
      @quality = quality
      @days_remaining = days_remaining
    end

    def tick
      @days_remaining -= 1
      return if @quality == 0

      @quality -= 1
      @quality -= 1 if @days_remaining <=0
    end
  end

  def brie_tick
    @item = Brie.new(quality, days_remaining)
    item.tick
  end

  class Brie
    attr_reader :quality, :days_remaining

    def initialize(quality, days_remaining)
      @quality = quality
      @days_remaining = days_remaining
    end

    def tick
      @days_remaining -= 1
      return if @quality >= 50

      @quality += 1
      @quality += 1 if @days_remaining <= 0 && @quality < 50
    end
  end

  def sulfuras_tick
    @item = Sulfuras.new(quality, days_remaining)
    item.tick
  end

  class Sulfuras
    attr_reader :quality, :days_remaining

    def initialize(quality, days_remaining)
      @quality = quality
      @days_remaining = days_remaining
    end

    def tick
    end
  end

  def backstage_tick
    @item = Backstage.new(quality, days_remaining)
    item.tick
  end

  class Backstage
    attr_reader :quality, :days_remaining

    def initialize(quality, days_remaining)
      @quality = quality
      @days_remaining = days_remaining
    end

    def tick
      @days_remaining -= 1
      return              if @quality >= 50
      return @quality = 0 if @days_remaining < 0

      @quality += 1
      @quality += 1 if @days_remaining < 10
      @quality += 1 if @days_remaining < 5
    end
  end

end
