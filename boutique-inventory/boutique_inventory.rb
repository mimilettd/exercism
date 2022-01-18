class BoutiqueInventory
  def initialize(items)
    @items = items
  end

  def item_names
    @items.map { |item| item[:name] }.sort
  end

  def cheap
    @items.select { |item| item[:price] < 30 }
  end

  def out_of_stock
    @items.select { |item| item[:quantity_by_size].empty? }
  end

  def stock_for_item(name)
    item = @items.first { |item| item[:name] == name }
    item[:quantity_by_size]
  end

  def total_stock
    @items.inject(0) do |sum, item|
      sum += item[:quantity_by_size].values.sum
    end
  end
end
