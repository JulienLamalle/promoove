class CategoriesController < ApplicationController

  def index 
    @categories = Category.all
  end

  def show 
    @category = Category.friendly.find(params[:id])
    @categories = Category.where.not(id: @category.id).order("RANDOM()").take(5)
    @projects = Project.joins(:project_categories).where(project_categories: {category_id: @category.id}).order("RANDOM()").take(24)
  end
end
