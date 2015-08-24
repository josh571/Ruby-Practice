class User < ActiveRecord::Base
    has_many :microposts
    #validates :user , presence: true
    #validates :, presence: true
end
