class GoalController < ApplicationController
  before_action :authenticate_pass!
  layout "userpage"
  
  def index
    @goals = Goal.where :user=> current_pass.user
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
    @goal = Goal.new
  end
  
  def edit
    @goal = Goal.find(params[:id])
    render :new
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def destroy
    @goal = Goal.find(params[:id])
    
    @goal.destroy
    redirect_to :userpage_index and return
  end
  private

  def goal_params
    allow = [:title, :description]
    params.require(:goal).permit(allow)
  end
end
