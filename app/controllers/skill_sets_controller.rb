class SkillSetsController < ApplicationController
  def create
    user = User.find(current_user._id)
    user.skill_sets.build(skill_set_params)

    respond_to do |format|
      if user.save
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("new-skill-set-form", partial: "skill_sets/form", locals: { skill_set: SkillSet.new }),
            turbo_stream.prepend("skill_sets", partial: "skill_sets/skill_set", locals: { skill_set: user.skill_sets.last }),
            turbo_stream.update("notice", html: "Skill set created successfully")
          ]
        end
      else
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("new-skill-set-form", partial: "skill_sets/form", locals: { skill_set: @skill_set }),
            turbo_stream.update("alert", html: @skill_set.errors.full_messages)
          ]
        end
      end
    end
  end

  def edit; end
  def update; end
  def delete; end

  private

  def skill_set_params
    params.require(:skill_set).permit(:category, entries: [])
  end
end
