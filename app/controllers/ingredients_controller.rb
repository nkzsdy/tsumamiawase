class IngredientsController < ApplicationController
  before_action :set_ingredient, only: :destroy

  def index
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_back(fallback_location: root_path)
    else
      #TODO エラーメッセージを表示
    end
  end

  def destroy
    if @ingredient.combinations.blank?
      @ingredient.delete
      redirect_to ingredients_path
    else
      #TODO エラーメッセージを表示
      redirect_to ingredients_path
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:user_id, :name)
  end

  def set_ingredient
    @ingredient = Ingredient.find_by(id: params[:id])
  end
end
