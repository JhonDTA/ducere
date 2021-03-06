# frozen_string_literal: true

# Professors controller
class ProfessorsController < ApplicationController
  before_action :set_professor, only: %i[show edit update destroy]

  # GET /professors
  # GET /professors.json
  def index
    pagination = { page: params[:page], per_page: 20 }
    @professors = Professor.paginate(pagination)
                           .includes(:user)
  end

  # GET /professors/1
  # GET /professors/1.json
  def show; end

  # GET /professors/new
  def new
    @professor = Professor.new
  end

  # GET /professors/1/edit
  def edit; end

  # POST /professors
  # POST /professors.json
  def create
    @professor = Professor.new(professor_params)

    respond_to do |format|
      if @professor.save
        format.html { redirect_to @professor, notice: t('created_resource', resource: resource_name) }
        format.json { render :show, status: :created, location: @professor }
      else
        format.html { render :new }
        format.json { render json: @professor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /professors/1
  # PATCH/PUT /professors/1.json
  def update
    respond_to do |format|
      if @professor.update(professor_params)
        format.html { redirect_to @professor, notice: t('updated_resource', resource: resource_name) }
        format.json { render :show, status: :ok, location: @professor }
      else
        format.html { render :edit }
        format.json { render json: @professor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professors/1
  # DELETE /professors/1.json
  def destroy
    @professor.destroy
    respond_to do |format|
      format.html { redirect_to professors_url, notice: t('destroyed_resource', resource: resource_name) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_professor
    @professor = Professor.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def professor_params
    params.require(:professor).permit(:user_id, :enrollment)
  end
end
