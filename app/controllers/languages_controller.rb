class LanguagesController < ApplicationController
  def index 
    @languages = Language.all
  end

  def show
    @language = Language.friendly.find(params[:id])
    @languages = Language.where.not(id: @language.id).order("RANDOM()").take(5)
    @projects = Project.joins(:project_languages).where(project_languages: {language_id: @language.id}).order("RANDOM()").take(24)
  end
end
