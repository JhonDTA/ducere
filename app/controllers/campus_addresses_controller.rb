class CampusAddressesController < ApplicationController
  before_action :set_campus_address, only: %i[show edit update destroy]

  # GET /campus_addresses
  # GET /campus_addresses.json
  def index
    @campus_addresses = CampusAddress.all
  end

  # GET /campus_addresses/1
  # GET /campus_addresses/1.json
  def show; end

  # GET /campus_addresses/new
  def new
    @campus_address = CampusAddress.new
  end

  # GET /campus_addresses/1/edit
  def edit; end

  # POST /campus_addresses
  # POST /campus_addresses.json
  def create
    @campus_address = CampusAddress.new(campus_address_params)

    respond_to do |format|
      if @campus_address.save
        format.html { redirect_to @campus_address, notice: 'Campus address was successfully created.' }
        format.json { render :show, status: :created, location: @campus_address }
      else
        format.html { render :new }
        format.json { render json: @campus_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campus_addresses/1
  # PATCH/PUT /campus_addresses/1.json
  def update
    respond_to do |format|
      if @campus_address.update(campus_address_params)
        format.html { redirect_to @campus_address, notice: 'Campus address was successfully updated.' }
        format.json { render :show, status: :ok, location: @campus_address }
      else
        format.html { render :edit }
        format.json { render json: @campus_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campus_addresses/1
  # DELETE /campus_addresses/1.json
  def destroy
    @campus_address.destroy
    respond_to do |format|
      format.html { redirect_to campus_addresses_url, notice: 'Campus address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_campus_address
    @campus_address = CampusAddress.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def campus_address_params
    params.require(:campus_address).permit(:campus_id, :address_id)
  end
end
