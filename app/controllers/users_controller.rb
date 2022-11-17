class UsersController < ApplicationController
  def show
    @skill_set = SkillSet.new
  end
end
