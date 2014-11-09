class SyllabusesController < CoursesController
  def index
    @courses = Syllabus.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @syllabus = Syllabus.find params[:id]
  end

  # GET /courses/new
  # GET /courses/new.json
  def new
    @syllabus = Syllabus.new

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
    @syllabus = Syllabus.new(params[:syllabus])
    respond_to do |format|
      if @syllabus.save
        format.html { redirect_to @syllabus, notice: 'syllabus was successfully created.' }
        format.json { render json: @syllabus, status: :created, location: @syllabus }
      else
        format.html { render action: "new" }
        format.json { render json: @syllabus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    @syllabus = Syllabus.find(params[:id])

    respond_to do |format|
      if @syllabus.update_attributes(params[:syllabus])
        format.html { redirect_to @syllabus, notice: 'syllabus was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @syllabus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
   super
  end
end
