class HomeworkMarksController < ApplicationController
  before_action :set_homework_mark, only: %i[show edit update destroy]

  # GET /homework_marks
  # GET /homework_marks.json
  def index
    pagination = { page: params[:page], per_page: 20 }
    @homework_marks = HomeworkMark.paginate(pagination)
  end

  # GET /homework_marks/1
  # GET /homework_marks/1.json
  def show; end

  # GET /homework_marks/new
  def new
    @homework_mark = HomeworkMark.new
  end

  # GET /homework_marks/1/edit
  def edit; end

  # POST /homework_marks
  # POST /homework_marks.json
  def create
    @homework_mark = HomeworkMark.new(homework_mark_params)

    respond_to do |format|
      if @homework_mark.save
        format.html { redirect_to @homework_mark, notice: 'Homework mark was successfully created.' }
        format.json { render :show, status: :created, location: @homework_mark }
      else
        format.html { render :new }
        format.json { render json: @homework_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homework_marks/1
  # PATCH/PUT /homework_marks/1.json
  def update
    respond_to do |format|
      if @homework_mark.update(homework_mark_params)
        format.html { redirect_to @homework_mark, notice: 'Homework mark was successfully updated.' }
        format.json { render :show, status: :ok, location: @homework_mark }
      else
        format.html { render :edit }
        format.json { render json: @homework_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homework_marks/1
  # DELETE /homework_marks/1.json
  def destroy
    @homework_mark.destroy
    respond_to do |format|
      format.html { redirect_to homework_marks_url, notice: 'Homework mark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_homework_mark
    @homework_mark = HomeworkMark.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def homework_mark_params
    params.require(:homework_mark).permit(:student_homework_id, :mark, :observations)
  end
end
