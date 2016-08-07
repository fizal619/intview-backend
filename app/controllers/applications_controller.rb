class ApplicationsController < ApplicationController

  def index
    #find the user who's token we got, then grab their applications.
    id = request.headers['Authorization'].split(':')[0]
    user = User.find(id)
    render json: user.applications
  end

  def create
    #find the user who's token we got, then save an application.
    id = request.headers['Authorization'].split(':')[0]
    user = User.find(id)

    Application.create({
      title: params['title'],
      questions: params['questions'],
      user: user
      })

    render json: {status: 'success'}
  end
end
