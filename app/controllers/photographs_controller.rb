class PhotographsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :destroy, :new]
  before_action :set_photograph, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]

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
    @comment = Comment.new
    @comments = @photograph.comments.includes(:user)
  end

  def search
    @photographs = Photograph.search(params[:keyword])
  end

  def edit
    unless user_signed_in? && current_user.id == @photograph.user_id
      redirect_to action: :index
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
    params.require(:photograph).permit(:title, :category_id, :prefecture_id, :description, :image, :address, :latitude, :longitude).merge(user_id: current_user.id)
  end

  def set_photograph
    @photograph = Photograph.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
