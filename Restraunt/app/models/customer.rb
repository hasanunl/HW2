class Customer < ApplicationRecord
    before_validation(on: :create) do
        self.full_name = self.full_name.delete(' ') if attribute_present?("full_name")
    end
    validates :full_name,presence: true
    has_many :reservations

    private


end
