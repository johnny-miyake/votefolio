class VotesController < InheritedResources::Base
  def index
    @poll = Poll.find params[:poll_id]
  end

  def create
    @item = Item.find vote_params[:item_id]
    @poll = @item.poll
    @poll.votes.create vote_params
    redirect_to user_poll_path @poll.user, @poll
  end

  private
  def vote_params
    params.require(:vote).permit :item_id, :comment
  end
end
