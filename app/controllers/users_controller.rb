class UsersController < ApplicationController
  def show
    @skill_set = SkillSet.new
    @profile = current_user.profile
    @experience = Experience.new
    @educational_qualification = EducationalQualification.new
  end
end
