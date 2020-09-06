# frozen_string_literal: true

class InstitutionAddressesController < ApplicationController
  before_action :set_institution_address, only: %i[show edit update destroy]

  # GET /institution_addresses
  # GET /institution_addresses.json
  def index
    @institution_addresses = InstitutionAddress.all
  end

  # GET /institution_addresses/1
  # GET /institution_addresses/1.json
  def show; end

  # GET /institution_addresses/new
  def new
    @institution_address = InstitutionAddress.new
  end

  # GET /institution_addresses/1/edit
  def edit; end

  # POST /institution_addresses
  # POST /institution_addresses.json
  def create
    @institution_address = InstitutionAddress.new(institution_address_params)

    respond_to do |format|
      if @institution_address.save
        format.html { redirect_to @institution_address, notice: 'Instution address was successfully created.' }
        format.json { render :show, status: :created, location: @institution_address }
      else
        format.html { render :new }
        format.json { render json: @institution_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /institution_addresses/1
  # PATCH/PUT /institution_addresses/1.json
  def update
    respond_to do |format|
      if @institution_address.update(institution_address_params)
        format.html { redirect_to @institution_address, notice: 'Instution address was successfully updated.' }
        format.json { render :show, status: :ok, location: @institution_address }
      else
        format.html { render :edit }
        format.json { render json: @institution_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /institution_addresses/1
  # DELETE /institution_addresses/1.json
  def destroy
    @institution_address.destroy
    respond_to do |format|
      format.html { redirect_to institution_addresses_url, notice: 'Instution address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_institution_address
    @institution_address = InstutionAddress.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def institution_address_params
    params.require(:institution_address).permit(:institution_id, :address_id)
  end
end
