class ResponsesController < ApplicationController
  skip_before_action :authenticate_user_from_token!, only: [:create, :options]

  def create
    print "PARAMS!"
    pp params
    application = Application.find(params['application_id'])

    res = Response.new({
      name: params['name'],
      email: params['email'],
      application: application
      })

    ########## https://developer.ibm.com/answers/questions/199673/what-is-the-best-way-to-integrate-watson-services.html
    # WATSON CODE

    content = params['content']

    countContent = content.split(' ')

    if (countContent.size < 3500 || nil)
      render json: {status: 'null'}
    else
      response = Excon.post("https://gateway.watsonplatform.net/personality-insights/api/v2/profile",
       :body => content,
       :user => ENV['WATSON_USERNAME'],
       :headers => { "Content-Type" => "text/plain" },
       :password => ENV['WATSON_PASSWORD']
        )

      ##save it
      res['personality_index'] = response.body

      ##########

      res.save

      render json: Response.last
    end

  end


end
