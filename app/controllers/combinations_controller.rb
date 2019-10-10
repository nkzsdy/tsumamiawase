class CombinationsController < ApplicationController
  before_action :set_combination, only: [:update, :edit, :destroy]

  def new
    @combination = Combination.new(user_id: current_user.id)
  end

  def create
    @combination = Combination.new(combination_params)
    if @combination.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @combination.update(combination_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    if @combination.delete
      redirect_to root_path
    end
  end

  private

  def combination_params
    params.require(:combination).permit(:user_id, :ingredient_id, :seasoning_id)
  end

  def set_combination
    @combination = Combination.find_by(id: params[:id])
  end
end
