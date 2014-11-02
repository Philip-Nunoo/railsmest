class GoalController < ApplicationController
  before_action :authenticate_pass!
  def index
    @goals = Goal.all
  end

  def create
    goal = Goal.new goal_params
    goal.user = current_pass.user

    if goal.save
      redirect_to :goal_index and return
    else
      redirect_to :goal_new and return
    end
  end

  def new
  end


  private

  def goal_params
    allow = [:title, :description]
    params.require(:goal).permit(allow)
  end
end
