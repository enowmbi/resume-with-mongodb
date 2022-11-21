class EducationalQualification
  include Mongoid::Document

  field :start_date, type: Date
  field :end_date, type: Date
  field :institution, type: String
  field :qualification, type: String
  field :visible, type: Boolean

  embedded_in :user
end

