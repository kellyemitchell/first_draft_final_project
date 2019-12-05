class DirectMessage < ApplicationRecord
  # Direct associations

  belongs_to :sender,
             :class_name => "User"

  belongs_to :parent,
             :class_name => "User"

  # Indirect associations

  # Validations

end
