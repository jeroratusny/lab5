class Monster < ApplicationRecord
  validates :name, :birthdate, presence: true
  has_many :tweets
  validate :phone_format
 

  def phone_format
    if PhoneValidator.new(phone).valid?
      return
    else
      errors.add(:phone, :invalid, message: "cannot be nil")
    end
  end
end
