class SeasoningsController < ApplicationController
  before_action :set_seasoning, only: :destroy

  def index
  end

  def create
    @seasoning = Seasoning.new(seasoning_params)
    if @seasoning.save
      redirect_back(fallback_location: root_path)
    else
      render 'index'
    end
  end

  def destroy
    if @seasoning.combinations.blank?
      @seasoning.delete
      redirect_back(fallback_location: root_path)
    else
      @seasoning.errors.add(@seasoning.name, "を使ったかけあわせが登録されているため削除できません。")
      render "index"
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
