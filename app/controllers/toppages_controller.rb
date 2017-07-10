class ToppagesController < ApplicationController
  include SessionsHelper
  def index
    if logged_in?
      @user = current_user
      @task = current_user.tasks.build
      @tasks = current_user.tasks.order('created_at DESC').page(params[:page])
    end
  end
end
