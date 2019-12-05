class Venue < ApplicationRecord
  # Direct associations

  has_many   :provider_updates,
             :dependent => :destroy

  has_many   :photos,
             :dependent => :destroy

  has_many   :users,
             :dependent => :nullify

  # Indirect associations

  # Validations

end
