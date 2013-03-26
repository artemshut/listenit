class VotesController :: ApplicationController

  respond_to :js, :html

  def create
    @vote = Vote.new(direction: params[:voteType], user_id: params[:userId])
    @vote.save
    respond_with @vote
  end
end