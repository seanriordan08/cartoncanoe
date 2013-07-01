class PollsController < ApplicationController
  skip_before_filter :authorize
  
  def face
    @polls = Poll.all

    respond_to do |format|
      format.html # face.html.erb
      format.json { render json: @polls }
    end
  end
  
    def index
    @polls = Poll.all

    respond_to do |format|
      format.html # face.html.erb
      format.json { render json: @polls }
    end
  end
  
end
