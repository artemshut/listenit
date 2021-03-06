class AudiosController < ApplicationController

  def index
    if params[:tag]
      @audios = Audio.tagged_with(params[:tag])
    else
      @audios = Audio.all
      @search = Audio.search do
        fulltext params[:search]
      end
      @audios = @search.results
      @audios_votes = Audio.find_with_reputation(:votes, :all, order: 'votes desc')
    end
  end


  def vote
    value = params[:type] == "up" ? 1 : -1
    @audio = Audio.find(params[:id])
    @audio.add_evaluation(:votes, value, current_user)
    redirect_to :back, notice: t(:vote_thanks)
  end

  def download
    @audio = Audio.find(params[:id])
    a = Audio.first
    file_path = @audio.audio_file_name
    if !file_path.nil?

      send_file "/public/audios/audios/000/000/082/original/#{a.audio_file_name}", :x_sendfile => true
    else
      redirect_to audio_url
    end
  end

  # GET /audios/1
  # GET /audios/1.json
  def show
    @audio = Audio.find(params[:id])
      respond_to do |format|
        format.json {render :json => resource }
        format.html {render :action => :show}
        format.any {
          path = resource.file.path(params[:style] || params[:format])
          head(:not_found) and return unless File.exist?(path)
          send_file path,
                    :filename => resource.file_file_name,
                    :disposition => "inline",
                    :type => request.format
        }
      end
  end

  # GET /audios/new
  # GET /audios/new.json
  def new
    @title = t(:new_audio)
    @audio = Audio.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @audio }
    end
  end

  # GET /audios/1/edit
  def edit
    @audio = Audio.find(params[:id])
  end

  # POST /audios
  # POST /audios.json
  def create
    @audio = Audio.new(params[:audio])
    @audio.user_id = current_user.id
    respond_to do |format|
      if @audio.save
        format.html { redirect_to @audio, notice: t(:audio_confirm) }
        format.json { render json: @audio, status: :created, location: @audio }
      else
        format.html { render action: "new" }
        format.json { render json: @audio.errors, status: :unprocessable_entity }
      end

    end
  end

  # PUT /audios/1
  # PUT /audios/1.json
  def update
    @audio = Audio.find(params[:id])

    respond_to do |format|
      if @audio.update_attributes(params[:audio])
        format.html { redirect_to @audio, notice: 'Audio was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @audio.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /audios/1
  # DELETE /audios/1.json
  def destroy
    @audio = Audio.find(params[:id])
    @audio.destroy
    respond_to do |format|
      flash[:success] = t(:audio_deleted)
      format.html { redirect_to  "/users/#{current_user.id}" }
      format.json { head :no_content }
    end
  end

end
