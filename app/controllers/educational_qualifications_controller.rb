class EducationalQualificationsController < ApplicationController
  before_action :set_user, only: %I[create update destroy]

  def create
    @user.educational_qualifications.build(educational_qualification_params)

    respond_to do |format|
      if @user.save
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("new-educational-qualification-form", partial: "educational_qualifications/form", locals: { educational_qualification: EducationalQualification.new }),
            turbo_stream.prepend("educational_qualifications", partial: "educational_qualifications/educational_qualification", locals: { educational_qualification: @user.educational_qualifications.last}),
            turbo_stream.update("notice", html: "educational_qualification created successfully")
          ]
        end
      else
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("new-educational-qualification-form", partial: "educational_qualifications/form", locals: { educational_qualification: @educational_qualification }),
            turbo_stream.update("alert", html: @educational_qualification.errors.full_messages)
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

  def educational_qualification_params
    params.require(:educational_qualification).permit(:start_date, :end_date, :institution, :qualification, :visible)
  end
end
