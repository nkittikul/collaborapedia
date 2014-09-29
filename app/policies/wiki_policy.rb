class WikiPolicy < ApplicationPolicy
  def new?
    user.present?
  end

  def show?
    true
  end

  def index?
    true
  end

  def edit?
    user.present? && user.wikis.include?(record)
  end

  def create?
    new?
  end

  def update?
    edit?
  end

  def private?
    user.present? && user.premium
  end

end