class ResponsesController < ApplicationController

  skip_before_action :authenticate_user_from_token!, only: [:create]

  def create
    application = Application.find(params['application_id'])


    res = Response.new({
      name: params['name'],
      email: params['email'],
      application: application
      })

    ##########
    # WATSON CODE

    res['personality_index'] = 'hardcoded for now'

    ##########

    res.save

    render json: {status: 'success'}
  end


end
