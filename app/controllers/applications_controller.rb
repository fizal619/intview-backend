class ApplicationsController < ApplicationController

  skip_before_action :authenticate_user_from_token!, only: [:show]

  ##################################################################

  def index
    #find the user who's token we got, then grab their applications.
    id = request.headers['Authorization'].split(':')[0]
    user = User.find(id)
    userAplications = user.applications

    #app array to save the results, temp measure
    appArray = []

    userAplications.each do |application|
      item = {
        application: application,
        responses: application.responses
      }
      appArray.push(item)
    end

    render json: appArray
  end

  ##################################################################

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

  ##################################################################

  def destroy
    #protected by authentication?
    id = request.headers['Authorization'].split(':')[0]
    user = User.find(id)

    application = user.applications.find(params[:id])
    application.destroy

    render json: {status: 'success'}
  end

  ##################################################################

  def show
    # send the appication data
    render json:  Application.find(params[:id])
  end

end
