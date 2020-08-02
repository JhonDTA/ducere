# frozen_string_literal: true

# Tutors controller
class TutorsController < ApplicationController
  before_action :set_tutor, only: %i[show edit update destroy]

  # GET /tutors
  # GET /tutors.json
  def index
    pagination = { page: params[:page], per_page: 20 }
    @tutors = Tutor.paginate(pagination)
                   .includes(index_includes)
  end

  # GET /tutors/1
  # GET /tutors/1.json
  def show; end

  # GET /tutors/new
  def new
    @tutor = Tutor.new
  end

  # GET /tutors/1/edit
  def edit; end

  # POST /tutors
  # POST /tutors.json
  def create
    @tutor = Tutor.new(tutor_params)

    respond_to do |format|
      if @tutor.save
        format.html { redirect_to @tutor, notice: 'Tutor was successfully created.' }
        format.json { render :show, status: :created, location: @tutor }
      else
        format.html { render :new }
        format.json { render json: @tutor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tutors/1
  # PATCH/PUT /tutors/1.json
  def update
    respond_to do |format|
      if @tutor.update(tutor_params)
        format.html { redirect_to @tutor, notice: 'Tutor was successfully updated.' }
        format.json { render :show, status: :ok, location: @tutor }
      else
        format.html { render :edit }
        format.json { render json: @tutor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutors/1
  # DELETE /tutors/1.json
  def destroy
    @tutor.destroy
    respond_to do |format|
      format.html { redirect_to tutors_url, notice: 'Tutor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tutor
    @tutor = Tutor.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tutor_params
    params.require(:tutor).permit(:student_id, :parent_id, :relationship_id)
  end

  def index_includes
    [{ student: :user }, { parent: :user }, :relationship]
  end
end
