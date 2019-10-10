class SeasoningsController < ApplicationController
  before_action :set_seasoning, only: :destroy

  def index
  end

  def create
    @seasoning = Seasoning.new(seasoning_params)
    if @seasoning.save
      redirect_back(fallback_location: root_path)
    else
      #TODO エラーメッセージを表示
    end
  end

  def destroy
    if @seasoning.combinations.blank?
      @seasoning.delete
      redirect_to seasonings_path
    else
      #TODO エラーメッセージを表示
      redirect_to seasonings_path
    end
  end

  private

  def seasoning_params
    params.require(:seasoning).permit(:user_id, :name)
  end

  def set_seasoning
    @seasoning = Seasoning.find_by(id: params[:id])
  end
end
