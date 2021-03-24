class AdminController < ApplicationController
  include AdminChecker

  before_action :check_if_admin

  def index 
  end
end
