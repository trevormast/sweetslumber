class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :registrations, dependent: :destroy
  has_many :workshops, through: :registrations

  scope :sorted_by_baby_dob, -> (workshop = Workshop.all) { joins(registrations: :questionaire)
                                                            .where(registrations: {workshop_id: workshop})
                                                            .order('questionaires.baby_dob DESC') }
end
