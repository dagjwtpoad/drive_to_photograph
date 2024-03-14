class PhotographsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :destroy, :new]

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
    @photograph = Photograph.find(params[:id])
  end

  def edit
    @photograph = Photograph.find(params[:id])
    unless current_user.id == @photograph.user_id
      redirect_to root_path
    end
  end

  def update
    photograph = Photograph.find(params[:id])
    if photograph.update(photograph_params)
      redirect_to photograph_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    photograph = Photograph.find(params[:id])
    photograph.destroy
    redirect_to root_path
  end

  private

  def photograph_params
    params.require(:photograph).permit(:title, :category_id, :prefecture_id, :description, :image).merge(user_id: current_user.id)
  end

end
