class ApplicationsController < ApplicationController

  def index
    #find the user who's token we got, then grab their applications.
    id = request.headers['Authorization'].split(':')[0]
    user = User.find(id)
    render json: user.applications
  end


end
