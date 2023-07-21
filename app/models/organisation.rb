  # app/models/organisation.rb
  class Organisation < ApplicationRecord
    has_many :users
    has_many :shifts
  end
  
class Shift < ApplicationRecord
  belongs_to :organisation
  # Other code...
end
