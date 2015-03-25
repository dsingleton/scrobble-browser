class UsersController < ApplicationController
  include NestableResource

  def index
    @users = users.chart.paginate(:page => params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

private

  def users
    if @resource
      @resource.users
    else
      User.joins(:scrobbles)
    end
  end
end
