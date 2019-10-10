module HomeHelper
  def combination_name(combination)
    ingredient_name = combination.ingredient.name
     seasoning_name = combination.seasoning.name

    "#{ingredient_name} × #{seasoning_name}"
  end
end
