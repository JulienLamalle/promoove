class Admin::DonationsController < ApplicationController
  include AdminChecker
  before_action :check_if_admin

  def index 
    @donations = Donation.includes(:user, :project).paginate(page: params[:page], per_page: 20)
  end
end
