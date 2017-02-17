class CategoriesController < ApplicationController

  def new

    @category = Category.new

  end

  def create
    category_params = params.require(:category).permit(:name)
      @category = Category.new(category_params)
      @category.save
      redirect_to @category

  end

  def show

    @category = Category.find(params[:id])

  end

  def edit
    @category = Category.find(params[:id])

  end

  def update
    category_params = params.require(:category).permit(:category_id)

    if @category.update(category_params)
      redirect_to @category
    end
  end

end
