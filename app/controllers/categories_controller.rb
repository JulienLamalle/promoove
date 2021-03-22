class CategoriesController < ApplicationController

  def index 
    @categories = Category.all
  end

  def show 
    @category = Category.friendly.find(params[:id])
    @project_categories = ProjectCategory.includes(:project).where(category_id: @category.id)
    @categories = Category.where.not(id: @category.id).order("RANDOM()").take(5)
  end
end
