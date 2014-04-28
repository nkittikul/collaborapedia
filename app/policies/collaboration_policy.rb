class CollaborationPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present? && user.wikis.include?(record.wiki)
  end
end