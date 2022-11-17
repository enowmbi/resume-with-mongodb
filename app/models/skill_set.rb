class SkillSet
  include Mongoid::Document

  field :category, type: String
  field :entries, type: Array, default: []

  embedded_in :user
end
