class PollsController < InheritedResources::Base
  before_filter :load_object, only: [:edit, :update, :destroy]

  def index
    @user = User.find params[:user_id]
    @polls = @user.polls
  end

  def new
    @poll = current_user.polls.build
  end

  def edit
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
    if @poll.update_attributes(poll_params)
      redirect_to user_polls_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @poll.destroy
    redirect_to user_polls_path(current_user)
  end

  private
  def poll_params
    params.require(:poll).permit(:title, :description)
  end

  def load_object
    @poll = current_user.polls.find params[:id]
  end
end
