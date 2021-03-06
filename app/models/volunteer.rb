class Volunteer < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :avatar_url, :last_name, :bio
  has_many :participations
  has_many :events, :through => :participations
  has_many :donations, :through => :participations
  has_many :offline_donations, :through => :participations
  has_many :follows
  has_secure_password

  validate :email_must_be_unique
  validates :password, :presence => true, :on => :create
  validates :email, :name, :presence => true

  # Validation to ensure emails are unique across both Merchants and Customers.
  def email_must_be_unique
    if ((Organization.where(['email = ?', self.email]).count > 0) or
        (Volunteer.where(['email = ? AND id <> ?', self.email, self.id]).count > 0))

      errors.add(:email, "is already taken")
    end
  end
  
  # Concatenates the first and last name and returns it as one string
  def full_name
  	if last_name.nil?
  		return name
  	else
  		return name + " " + last_name
  	end
  end
end
