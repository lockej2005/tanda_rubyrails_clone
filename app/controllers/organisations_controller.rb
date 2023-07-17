class OrganisationsController < ApplicationController
  before_action :set_organisation, only: %i[ show edit update destroy join ]

  def index
    @organisations = current_user.organisations
    @all_organisations = Organisation.all
    @new_organisation = Organisation.new
  end

  def create
    @organisation = Organisation.new(organisation_params)

    respond_to do |format|
      if @organisation.save
        format.html { redirect_to @organisation, notice: "Organisation was successfully created." }
        format.json { render :show, status: :created, location: @organisation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  ...
  
  def join
    current_user.organisations << @organisation unless current_user.organisations.include?(@organisation)
    redirect_to organisations_path
  end

  ...
  
  private
    def set_organisation
      @organisation = Organisation.find(params[:id])
    end

    def organisation_params
      params.require(:organisation).permit(:name, :hourly_rate)
    end
end
