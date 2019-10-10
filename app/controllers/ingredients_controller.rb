class IngredientsController < ApplicationController
  before_action :set_ingredient, only: :destroy

  def index
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_back(fallback_location: root_path)
    else
      render 'index'
    end
  end

  def destroy
    if @ingredient.combinations.blank?
      @ingredient.delete
      redirect_back(fallback_location: root_path)
    else
      @ingredient.errors.add(@ingredient.name, "を使ったかけあわせが登録されているため削除できません。")
      render "index"
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
