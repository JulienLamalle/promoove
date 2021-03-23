class LanguagesController < ApplicationController
  def index 
    @languages = Language.all
  end

  def show
    @language = Language.friendly.find(params[:id])
  end
end
