class PhotographsController < ApplicationController
  before_action :authenticate_user!

  def index
    @photographs = Photograph.all.order(created_at: :desc)
  end

  def new
    @photograph = Photograph.new
  end

  def create
    @photograph = Photograph.new(photograph_params)
    if @photograph.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def photograph_params
    params.require(:photograph).permit(:title, :category_id, :prefecture_id, :description, :image).merge(user_id: current_user.id)
  end

end
