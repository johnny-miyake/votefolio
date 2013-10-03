class VotesController < InheritedResources::Base
  def index
    @poll = Poll.find params[:poll_id]
  end

  def create
    @item = Item.find vote_params[:item_id]
    @poll = @item.poll
    if @vote = @poll.votes.create(vote_params)
      redirect_to user_poll_votes_path @poll.user, @poll
    else
      redirect_to user_poll_path @poll.user, @poll
    end
  end

  private
  def vote_params
    params.require(:vote).permit :item_id, :comment
  end
end
