class Venue < ApplicationRecord
  # Direct associations

  has_many   :photos,
             :dependent => :destroy

  has_many   :users,
             :dependent => :nullify

  # Indirect associations

  # Validations

end
