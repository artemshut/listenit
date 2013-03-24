class TagsController < ApplicationController
  def index
    @tag = Tag.all
    respond_to do |format|
      format.html
      format.json { render :json => @tag.map(&:attributes) }
    end
  end
end