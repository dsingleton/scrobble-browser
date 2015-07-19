module NestableResource
  extend ActiveSupport::Concern

  included do
    before_action :set_resources
  end

private

  def set_resources
    @resource = get_parent_resource
  end

  def get_parent_resource
    if params[:user_id]
      @user = User.find(params[:user_id])
    elsif params[:artist_id]
      @artist = Artist.find_by_name!(params[:artist_id])
      if params[:track_id]
        @track = @artist.tracks.find_by_name!(params[:track_id])
      else
        @artist
      end
    else
      nil
    end
  end
end
