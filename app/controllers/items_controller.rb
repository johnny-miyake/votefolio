class ItemsController < InheritedResources::Base
  def create
    @poll = current_user.polls.find params[:poll_id]
    @item = @poll.items.build item_params
    if @item.save
      redirect_to user_poll_path(current_user, @poll)
    else
      render controller: :poll, action: :show
    end
  end

  def destroy
    @poll = current_user.polls.find params[:poll_id]
    @item = @poll.items.find params[:id]
    @item.destroy
    redirect_to user_poll_path(current_user, @poll)
  end

  private
  def item_params
    params.require(:item).permit(:caption)
  end
end
