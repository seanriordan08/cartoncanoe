class PollsController < ApplicationController
  skip_before_filter :authorize 
  
  def index
    @poll = Poll.new
  end
  
  def new
    @poll = Poll.new
  end
  
  def show
    @currentTime = Time.zone.now
	tomorrow = Time.zone.today + 1.day
	dayAfter = Time.zone.today + 2.day
	@stickyDay1 = tomorrow.strftime("%a")
	@stickyDay2 = dayAfter.strftime("%a")
  
    @polls = Poll.all
  end
  
  def create
    @poll = Poll.new(params[:poll])

    respond_to do |format|
      if @poll.save
        format.html { 
			flash[:notice] = 'Your Email Was Received - Thank You!' 
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
