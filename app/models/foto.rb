class Foto < ActiveRecord::Base
  belongs_to :album
  
  has_attached_file :image, :styles => { :thumb => "150x150>", :medio => "542x399>" },
        :url => "/uploads/:attachment/:id/:basename_:style.:extension",
        :path => ":rails_root/public/uploads/:attachment/:id/:basename_:style.:extension"
end
