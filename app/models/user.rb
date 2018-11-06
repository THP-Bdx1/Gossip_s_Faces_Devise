class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    attr_accessor :sign_up_code
  validates :sign_up_code,
    on: :create,
    presence: true,
    inclusion: { in: ["THP-MADERFUKER"] }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
