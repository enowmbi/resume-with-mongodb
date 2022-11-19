class Profile
  include Mongoid::Document

  field :summary, type: String
  field :github_url, type: String

  embedded_in :user
end
