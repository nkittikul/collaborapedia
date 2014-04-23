class Wiki < ActiveRecord::Base
  has_many :articles
  has_many :collaborations
  has_many :users, through: :collaborations
  after_create :makeCreatorCollaborator

  private

  def makeCreatorCollaborator
  end
end
