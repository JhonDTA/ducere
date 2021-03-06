# frozen_string_literal: true

# Relationships controller
class RelationshipsController < ApplicationController
  before_action :set_relationship, only: %i[show edit update destroy]

  # GET /relationships
  # GET /relationships.json
  def index
    pagination = { page: params[:page], per_page: 20 }
    @relationships = Relationship.paginate(pagination)
                                 .includes(:status)
  end

  # GET /relationships/1
  # GET /relationships/1.json
  def show; end

  # GET /relationships/new
  def new
    @relationship = Relationship.new
  end

  # GET /relationships/1/edit
  def edit; end

  # POST /relationships
  # POST /relationships.json
  def create
    @relationship = Relationship.new(relationship_params)

    respond_to do |format|
      if @relationship.save
        format.html { redirect_to @relationship, notice: t('created_resource', resource: resource_name) }
        format.json { render :show, status: :created, location: @relationship }
      else
        format.html { render :new }
        format.json { render json: @relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relationships/1
  # PATCH/PUT /relationships/1.json
  def update
    respond_to do |format|
      if @relationship.update(relationship_params)
        format.html { redirect_to @relationship, notice: t('updated_resource', resource: resource_name) }
        format.json { render :show, status: :ok, location: @relationship }
      else
        format.html { render :edit }
        format.json { render json: @relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relationships/1
  # DELETE /relationships/1.json
  def destroy
    @relationship.destroy
    respond_to do |format|
      format.html { redirect_to relationships_url, notice: t('destroyed_resource', resource: resource_name) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_relationship
    @relationship = Relationship.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def relationship_params
    params.require(:relationship).permit(:name, :status_id)
  end
end
