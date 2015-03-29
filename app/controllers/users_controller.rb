class UsersController < ApplicationController
  include NestableResource
  include FilterableResource

  def index
    @users = apply_filters(users.chart)
    @users = @users.paginate(:page => params[:page])
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
