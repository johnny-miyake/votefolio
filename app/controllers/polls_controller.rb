class PollsController < InheritedResources::Base

  def new
    @poll = current_user.polls.build
  end

  def edit
    @poll = current_user.polls.find params[:id]
  end

  def create
    @poll = current_user.polls.build(poll_params)
    if @poll.save
      redirect_to user_poll_path(current_user, @poll)
    else
      render :new
    end
  end

  def update
    @poll = current_user.polls.find params[:id]
    if @poll.update_attributes(poll_params)
      redirect_to user_polls_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @poll = current_user.polls.find params[:id]
    @poll.destroy
    redirect_to user_polls_path(current_user)
  end

  private
  def poll_params
    params.require(:poll).permit(:title, :description)
  end
end
