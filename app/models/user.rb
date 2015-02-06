class User < ActiveRecord::Base
    before_save{self.email=email.downcase}
    validates :name, presence: true
    validates :email, presence: true
end
