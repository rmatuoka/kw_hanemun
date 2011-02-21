class User < ActiveRecord::Base
  acts_as_authentic
  has_many :infos
  has_many :albums
  has_many :scrapbooks
  has_many :hotels
  has_many :hairs
  has_many :packages
  has_many :presencas
  
  
  has_attached_file :avatar, :styles => { :home => "140x209>"},
        :url => "/uploads/:attachment/:id/:basename_:style.:extension",
        :path => ":rails_root/public/uploads/:attachment/:id/:basename_:style.:extension"
        
    #def find_by_user
    #  return User.first(:conditions => ['username = ?', param[:user]])
    #end
end
