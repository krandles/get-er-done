class CategoriesController < ApplicationController
  before_action :find_category, only:[:show, :edit, :update, :destroy]
  def index
    @categories = Category.all
  end

  def show

  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.valid?
      @category.save
      redirect_to @category
    else
      flash[:errors] = @category.errors.full_messages
      redirect_to new_category_path
    end
  end

  def edit
  end

  def update
    @category.assign_attributes(category_params)

    if @category.valid?
      @category.save
      redirect_to @category
    else
      flash[:errors] = @category.errors.full_messages
      redirect_to edit_category_path(@category.id)
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
    @category = Category.find_by(id:params[:id])
  end
end
