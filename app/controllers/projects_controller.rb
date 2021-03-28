class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update]

  def index
    @last_week_projects = Project.includes(:project_languages, :languages).created_in(1.week.ago.to_date, Time.now).validated.sorted
    @last_month_projects = Project.includes(:project_languages, :languages).created_in(1.month.ago.to_date, Time.now).validated.sorted
    @projects = Project.includes(:project_languages, :languages).all.sorted.validated
    @donations = Donation.includes(:project, :user).all.order(created_at: :desc).take(10)
    @languages = Language.all
    @categories = Category.all
  end

  def show
    @project = Project.friendly.find(params[:id])
    @categories = @project.categories
    @languages = @project.languages
    @collaborators = @project.users.includes([:profile_picture_attachment])
    @comments = @project.comments.includes(:comment_answers, :user => [:profile_picture_attachment]).order(created_at: :asc)
  end

  def new
    @project = Project.new
    @user = current_user
    @categories = Category.all
    @languages = Language.all
    @media_type = MediaType.all
    @media = Media.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)
    @media = Media.new(media_params)
    if @project.save
      if @media.save
        ProjecMedia.create(media_id: @media, project_id: @project)
      end
      Collaboration.create(user_id: current_user.id, project_id: @project.id, role_id: Role.first)
      flash[:info] = "Votre projet a été créé et est visible uniquement par vous pour le moment, vous pouvez le déclarer comme complet en vous rendant dessus"
      redirect_to root_path
    end
  end

  def update
    @project.update(project_params)
    if @project.save
      flash[:success] = "Projet édité!"
      redirect_to projects_path
    else
      flash[:error] = @project.errors.messages
    end
  end

  private

  def project_params
    params.require(:project).permit(
      :name,
      :short_description,
      :long_description,
      :value_of_project,
      :money_earned,
      :number_of_developpers_on_project,
      :daily_time_spent_on_project_per_developper,
      :link_of_github,
      :license,
      :video_link,
      :is_complete,
      :is_validated
    )
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
