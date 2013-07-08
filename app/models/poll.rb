﻿class Poll < ActiveRecord::Base
  attr_accessible :allergy, :email, :money, :time
  
  private
  
  validates :email, :presence => true, :uniqueness=> true 
  validates_format_of :email, :with => /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i

end
