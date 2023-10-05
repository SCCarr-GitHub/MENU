if @item.persisted?
  json.form render(partial: "restaurant_menus/item_form", formats: :html, locals: {item: Item.new})
  json.inserted_item render(partial: "items/item", formats: :html, locals: {item: @item})
else
  json.form render(partial: "restaurant_menus/item_form", formats: :html, locals: {item: @item})
end
