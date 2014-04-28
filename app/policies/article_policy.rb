class ArticlePolicy < ApplicationPolicy
  def new?
    user.present? && user.wikis.include?(record) #here, record is wiki, not article
  end

  def edit?
    user.present? && user.wikis.include?(record)
  end

  def show?
    true
  end

  def create?
    new?
  end

  def update?
    edit?
  end
end