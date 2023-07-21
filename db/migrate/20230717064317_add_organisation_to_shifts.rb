class AddOrganisationToShifts < ActiveRecord::Migration[7.0]
  def change
    add_reference :shifts, :organisation, null: false, foreign_key: true
  end
end
