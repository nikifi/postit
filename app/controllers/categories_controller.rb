class CategoriesController < ApplicationController
   before_action :require_user
  def new

    @category = Category.new

  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Your new category has been saved"
      redirect_to posts_path
    else
      render :new
    end
  end

  def show

  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end