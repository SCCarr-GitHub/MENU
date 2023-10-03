class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:restaurant_owner, :photo])

    devise_parameter_sanitizer.permit(:account_update, keys: [:restaurant_owner, :photo])
  end
end

def test_hash
  @items = {
    "starter" => [
      {
        "item_name" => "Garlic Bread",
        "item_price" => 6.99
      },
      {
        "item_name" => "Potato Wedges",
        "item_price" => 6.99
      },
      {
        "item_name" => "Meat Ball",
        "item_price" => 6.99
      },
      {
        "item_name" => "Onion Rings",
        "item_price" => 6.99
      },
      {
        "item_name" => "French Fries",
        "item_price" => 6.99
      },
      {
        "item_name" => "Ratatouille",
        "item_price" => 6.99
      }
    ],
    "main" => [
      {
        "item_name" => "Grilled Fingerlings",
        "item_price" => 6.99
      },
      {
        "item_name" => "Grilled potatoes with a Western flair served with sauce of choice.",
        "item_price" => 6.99
      },
      {
        "item_name" => "Asian Pear Salad",
        "item_price" => 6.99
      },
      {
        "item_name" => "Crisp pears and pecan and maple syrup with cheese frisée.",
        "item_price" => 6.99
      },
      {
        "item_name" => "Roasted Acorn Squash",
        "item_price" => 6.99
      },
      {
        "item_name" => "Spicy-sweet, soft wedges potatoes.",
        "item_price" => 6.99
      },
      {
        "item_name" => "Smothered Chicken",
        "item_price" => 6.99
      },
      {
        "item_name" => "Grilled chicken breast topped with Grilled chicken breast topped with mushrooms, onions, and Cheese",
        "item_price" => 6.99
      }
    ],
    "dessert" => [
      {
        "item_name" => "Banana Split",
        "item_price" => 6.99
      },
      {
        "item_name" => "Cheese Cake",
        "item_price" => 6.99
      },
      {
        "item_name" => "Chocolate Ice Cream",
        "item_price" => 6.99
      },
      {
        "item_name" => "Fruit Cake",
        "item_price" => 6.99
      }
    ],
    "drink" => [
      {
        "item_name" => "Coffee",
        "item_price" => 6.99
      },
      {
        "item_name" => "Ice/Hot Tea",
        "item_price" => 6.99
      },
      {
        "item_name" => "Thai Tea",
        "item_price" => 6.99
      },
      {
        "item_name" => "Soda",
        "item_price" => 6.99
      }
    ]
  }
end
