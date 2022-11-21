class UsersController < ApplicationController
  def show
    @skill_set = SkillSet.new
    @profile = current_user.profile
    @experience = Experience.new
  end
end
