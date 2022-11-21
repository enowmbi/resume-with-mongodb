class ExperiencesController < ApplicationController
  before_action :set_user, only: %I[create update destroy]

  def create
    @user.experiences.build(experience_params)

    respond_to do |format|
      if @user.save
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("new-experience-form", partial: "experiences/form", locals: { experience: Experience.new }),
            turbo_stream.prepend("experiences", partial: "experiences/experience", locals: { experience: @user.experiences.last}),
            turbo_stream.update("notice", html: "Experience created successfully")
          ]
        end
      else
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("new-experience-form", partial: "experiences/form", locals: { experience: @experience }),
            turbo_stream.update("alert", html: @experience.errors.full_messages)
          ]
        end
      end
    end
  end

  def update; end

  def destroy; end

  private

  def set_user
    @user = User.find(current_user._id)
  end

  def experience_params
    params.require(:experience).permit(:start_date, :end_date, :company, :location, :visible, achievements: [], tools: [])
  end
end
