class WelcomeController < ApplicationController
  def index
    @users = User.all

    @goals = Goal.all
  end

  def new_goal
  end


end
