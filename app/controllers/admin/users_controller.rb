class Admin::UsersController < ApplicationController
  include AdminChecker
  before_action :check_if_admin
  before_action :set_user, except: [:index]

  def index 
    @users = User.all
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Profil modifié !"
      redirect_to admin_users_fr_path
    else
      flash[:alert] = "Le profil n'a pas pû être modifié #{@user.errors.full_messages}"
      render :action => 'edit'
    end
  end

  def destroy
    if @user.destroy
      Collaboration.where(user_id: @user.id).each do |project|
        project.destroy
      end
    end
  end
  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :github_link, :gitlab_link, :twitter_link, :linkedin_link, :professional_background, :description, :date_of_birth, :profile_picture)
  end
end
