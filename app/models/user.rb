class User < ActiveRecord::Base
  belongs_to :story
  before_save{self.email=email.downcase}
  validates :name, presence: true
  validates :email, presence: true
end
