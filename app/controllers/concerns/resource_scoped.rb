module ResourceScoped
  extend ActiveSupport::Concern

  included do
    before_action :setup_resource
  end

private

  def setup_resource
    @resource = setup_resources
  end

  def setup_resources
    if params[:user_id]
      @user = User.find(params[:user_id])
    elsif params[:artist_id]
      @artist = Artist.find(params[:artist_id])
      if params[:track_id]
        @track = @artist.tracks.find(params[:track_id])
      else
        @artist
      end
    else
      nil
    end
  end
end
