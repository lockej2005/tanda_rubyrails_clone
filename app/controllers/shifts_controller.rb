class ShiftsController < ApplicationController
  before_action :set_shift, only: %i[ show edit update destroy ]

  # GET /shifts or /shifts.json
  def index
    @organisation = Organisation.find(params[:organisation_id])
    @shifts = @organisation.shifts.order(created_at: :desc)
  end
  
  

  # GET /shifts/1 or /shifts/1.json
  def show
    @organisation = Organisation.find(params[:organisation_id])
  end
  

  # GET /shifts/new
  def new
    @organisation = Organisation.find(params[:organisation_id])
    @shift = @organisation.shifts.new
  end
  
  

  # GET /shifts/1/edit
  def edit
  end



  # POST /shifts or /shifts.json
def create
  @organisation = Organisation.find(params[:organisation_id])
  @shift = @organisation.shifts.new(shift_params)

    respond_to do |format|
      if @shift.save
        format.html { redirect_to organisation_shift_url(@organisation, @shift), notice: "Shift was successfully created." }
        format.json { render :show, status: :created, location: @shift }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shifts/1 or /shifts/1.json
  def update
    respond_to do |format|
      if @shift.update(shift_params)
        format.html { redirect_to organisation_shift_url(@organisation, @shift), notice: "Shift was successfully updated." }
        format.json { render :show, status: :ok, location: @shift }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shifts/1 or /shifts/1.json
  def destroy
    @shift.destroy

    respond_to do |format|
      format.html { redirect_to organisation_shifts_url(@organisation), notice: "Shift was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shift
      @organisation = Organisation.find(params[:organisation_id])
      @shift = Shift.find(params[:id])
    end
    

    # Only allow a list of trusted parameters through.
# Only allow a list of trusted parameters through.
    def shift_params
      params.require(:shift).permit(:start, :finish, :break_length, :user_id, :organisation_id)
    end
  end
