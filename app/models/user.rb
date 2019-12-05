class User < ApplicationRecord
  # Direct associations

  belongs_to :venue

  has_many   :sent_messages,
             :class_name => "DirectMessage",
             :foreign_key => "sender_id",
             :dependent => :destroy

  has_many   :direct_messages,
             :foreign_key => "parent_id",
             :dependent => :destroy

  has_many   :parent_comments,
             :dependent => :destroy

  has_many   :comments,
             :class_name => "ProviderUpdate",
             :dependent => :destroy

  has_many   :photos,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
