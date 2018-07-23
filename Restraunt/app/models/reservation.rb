class Reservation < ApplicationRecord
  before_create :random_code
  before_create :today
  belongs_to :customer
  after_create :send_email
  #validate :date , if: :is_it_sunday?
  before_validation  :is_it_sunday

  private

  def random_code
    rnd_code = (0...10).map { ('a'..'z').to_a[rand(26)] }.join
    self.reservation_code = rnd_code
  end

  def today
    self.date = Time.new
  end

  def send_email
    #
  end


  def is_it_sunday
      	time = DateTime.new
      		if time.sunday?
      			errors.add(:base, "You can't make reservations in Sunday.")
      		end
      
  end
end
