
class PodcastPolicy < ApplicationPolicy
  def create?
    user.present?
  end


  def show?
    true
  end

  def update?
    user.present? && (record.user == user)
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
