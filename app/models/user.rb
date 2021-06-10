class User < ApplicationRecord
    
    validates :username, presence: true, length:{maximum:15}, format: { with: /\A[\w-]+\z/, message: "your name requirements" }
    validates :email, presence: true, format: { with: /\w+@\w+(.com)/}
    validates :password, length: { in: 6..20 }, presence: true
    validate :password_requirements_are_met

    def password_requirements_are_met
        rules = {
          " must contain at least one lowercase letter"  => /[a-z]+/,
          " must contain at least one uppercase letter"  => /[A-Z]+/,
          " must contain at least one digit"             => /\d+/,
        }
      
        rules.each do |message, regex|
          errors.add( :password, message ) unless password.match( regex )
        end
    end
end
