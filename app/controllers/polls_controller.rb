class PollsController < ApplicationController
  skip_before_filter :authorize
  
  def index
    @poll = Poll.new
  end
  
  def new
  end
  
  def show
    @polls = Poll.all
  end
  
  def create
    @poll = Poll.new(params[:poll])

    respond_to do |format|
      if @poll.save
        format.html { 
			flash[:notice] = 'Poll was successfully created.' 
			redirect_to polls_path
		}
        format.json { render action: polls_path, status: :created, location: @poll }
      else
		format.html { redirect_to (polls_path) }
		format.js
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

end
