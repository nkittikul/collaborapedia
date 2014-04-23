class Collaboration < ActiveRecord::Base
  belongs_to :user
  belongs_to :wiki

  def addUserByEmail(user, wiki) #user is an email address, wiki is just an id

  end
end
