class ChaptersController < CoursesController
  
  def index
    @chapters = Chapter.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @chapter = Chapter.find params[:id]
  end

  # GET /courses/new
  # GET /courses/new.json
  def new
    @chapter = Chapter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/1/edit
  def edit
   super
  end

  # POST /courses
  # POST /courses.json
  def create
    @chapter = Chapter.new(params[:chapter])
    respond_to do |format|
      if @chapter.save
        format.html { redirect_to @chapter, notice: 'chapter was successfully created.' }
        format.json { render json: @chapter, status: :created, location: @chapter }
      else
        format.html { render action: "new" }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    @chapter = Chapter.find(params[:id])

    respond_to do |format|
      if @chapter.update_attributes(params[:chapter])
        format.html { redirect_to @chapter, notice: 'chapter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
   super
  end
end
