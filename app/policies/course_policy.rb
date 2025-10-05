# frozen_string_literal: true

class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.teacher? || user.admin?
        scope.all
      else
        scope.none
      end
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.teacher? || user.admin?
  end

  def update?
    user.teacher? || user.admin?
  end

  def destroy?
    user.admin?
  end
end
