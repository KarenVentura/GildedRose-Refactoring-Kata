class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      set_quality_by(item)
      set_sell_in_by(item)
    end
  end

  def set_quality_by(item)
    item.quality = item.quality - 1 if names_validation_for(item)
    item.quality = (return_quality(item) + 1) if item.quality < 50 && item.name == "Backstage passes to a TAFKAL80ETC concert"
  end

  def set_sell_in_by(item)
    item.sell_in = item.sell_in - 1 if item.name != "Sulfuras, Hand of Ragnaros"
  end

  def names_validation_for(item)
    item.name != "Aged Brie" && item.name != "Backstage passes to a TAFKAL80ETC concert" && item.name != "Sulfuras, Hand of Ragnaros" && item.quality > 0
  end

  def return_quality(item)
    case item.sell_in
    when item.sell_in < 0
      item.quality + 2
    when item.sell_in < 6
      item.quality + 3
    when item.sell_in < 11
      item.quality + 2
    when !item.sell_in < 0 && !validation_for(item)
      item.quality - item.quality
    end
  end
end
