class ProfilesController < ApplicationController
  before_action :set_user, only: %I[create update]

  def create
    @user.profile = Profile.new(profile_params)
    respond_to do |format|
      if @user.save
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("notice", html: "Profile summary and GitHub url saved successfully")
          ]
        end
      else
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("alert", html: @profile.errors.full_messages)
          ]
        end
      end
    end
  end

  def update
    @user.profile.update(profile_params)
    respond_to do |format|
      if @user.save
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("notice", html: "Profile summary and Github url updated successfully")
          ]
        end
      else
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("alert", html: @profile.errors.full_messages)
          ]
        end
      end
    end
  end

  private

  def set_user
    @user = User.find(current_user._id)
  end

  def profile_params
    params.require(:profile).permit(:summary, :github_url)
  end
end
