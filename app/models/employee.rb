class Employee < ApplicationRecord
    validates :first_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
    validates :last_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
    validates :age, presence: true, numericality: true
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
    validates :no_of_order, presence: true, numericality: true
    validates :full_time_available, presence: true
    validates :salary, presence: true, numericality: true
end
