class Item < ApplicationRecord
  include PgSearch::Model
  belongs_to :restaurant_menu
  has_many :ratings, dependent: :destroy
  has_one_attached :photo

  multisearchable against:
      [ :item_name, :category ]

  def self.import_items_from_hash(items_hash, restaurant_menu)
    items_instances = []
    items_hash.each do |category, items|
      items.each do |item_data|
        item = Item.new(
          category: category,
          item_name: item_data["item_name"],
          item_price: item_data["item_price"],
          restaurant_menu_id: restaurant_menu.id
        )
        items_instances << item
      end
    end

    Item.transaction do
      items_instances.each(&:save)
    end
  end
end
