class User < ActiveRecord::Base
  attr_accessible :name, :login, :email

  has_many :authorizations
  validates_presence_of :name
  has_many :questions
  
end
