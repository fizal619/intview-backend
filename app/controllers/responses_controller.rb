class ResponsesController < ApplicationController

  skip_before_action :authenticate_user_from_token!, only: [:create]

  def create
    application = Application.find(params['application_id'])

    Response.create({
      name: params['name'],
      email: params['email'],
      # personaility_index: 'hardcoded for now',
      application: application
      })

    render json: {status: 'success'}
  end


end
