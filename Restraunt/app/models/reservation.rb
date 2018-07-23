class Reservation < ApplicationRecord
  before_create :random_code
  belongs_to :customer
  after_create :send_email

  private

  def random_code
    rnd_code = (0...20).map { ('a'..'z').to_a[rand(26)] }.join
    self.reservation_code = rnd_code
  end

  def send_email
    #
  end
end
