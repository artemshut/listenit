class TagsController < ApplicationController

  before_filter :authenticate_user!, :get_query


  def get_query
    @query = params[:term]
  end

  def index
    @tags = ActsAsTaggableOn::Tag.where('name like ?', "%#{@query}%")
    respond_to do |format|
      format.json { render :json =>
                               @tags.limit(10).map{ |t| {
                                   'id' => t.id,
                                   'label' => t.name,
                                   'value' => t.name } }.to_json }
      format.html
    end
  end
end