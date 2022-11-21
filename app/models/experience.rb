class Experience
  include Mongoid::Document

  field :start_date, type: Date
  field :end_date, type: Date
  field :still_work_here, type: Boolean, default: false
  field :company, type: String
  field :position, type: String
  field :location, type: String
  field :visible, type: Boolean
  field :achievements, type: Array
  field :tools, type: Array
  embedded_in :user
end
