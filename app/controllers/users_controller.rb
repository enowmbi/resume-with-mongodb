class UsersController < ApplicationController
  def show
    @skill_set = SkillSet.new
    @profile = current_user.profile
  end
end
