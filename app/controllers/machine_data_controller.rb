class MachineDataController < ApplicationController
  before_action :set_machine_datum, only: [:show, :edit, :update, :destroy]

  # GET /machine_data
  # GET /machine_data.json
  def index
    @machine_data = MachineDatum.all
  end

  # GET /machine_data/1
  # GET /machine_data/1.json
  def show
  end

  # GET /machine_data/new
  def new
    @machine_datum = MachineDatum.new
  end

  # GET /machine_data/1/edit
  def edit
  end

  # POST /machine_data
  # POST /machine_data.json
  def create
    @machine_datum = MachineDatum.new(machine_datum_params)

    respond_to do |format|
      if @machine_datum.save
        format.html { redirect_to @machine_datum, notice: 'Machine datum was successfully created.' }
        format.json { render :show, status: :created, location: @machine_datum }
      else
        format.html { render :new }
        format.json { render json: @machine_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /machine_data/1
  # PATCH/PUT /machine_data/1.json
  def update
    respond_to do |format|
      if @machine_datum.update(machine_datum_params)
        format.html { redirect_to @machine_datum, notice: 'Machine datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @machine_datum }
      else
        format.html { render :edit }
        format.json { render json: @machine_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /machine_data/1
  # DELETE /machine_data/1.json
  def destroy
    @machine_datum.destroy
    respond_to do |format|
      format.html { redirect_to machine_data_url, notice: 'Machine datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_machine_datum
      @machine_datum = MachineDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def machine_datum_params
      params.require(:machine_datum).permit(:name, :preread_json)
    end
end
