class Admin::DonationsController < ApplicationController
  include AdminChecker
  before_action :check_if_admin

  def index 
    @donations = Donation.all
  end
end
