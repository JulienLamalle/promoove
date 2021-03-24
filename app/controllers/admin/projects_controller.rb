class Admin::ProjectsController < ApplicationController
  include AdminChecker
  before_action :check_if_admin
  before_action :set_project, except: [:index]

  def index
    @projects = Project.all
  end

  private

  def set_project
    @project = Project.friendly.find(params[:id])
  end
end
