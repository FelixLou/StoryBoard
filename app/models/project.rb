class Project < ActiveRecord::Base
  has_many :stories, dependent: :destroy
  has_many :users
  validates :title, presence: true, length:{minimum: 5}
end
