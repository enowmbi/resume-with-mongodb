class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  field :schema_version,      type: String, default: "1.0"
  ## Database authenticatable
  field :first_name,          type: String, default: ""
  field :last_name,           type: String, default: ""
  field :username,            type: String, default: ""
  field :email,               type: String, default: ""
  field :encrypted_password,  type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Confirmable
  field :confirmation_token,   type: String
  field :confirmed_at,         type: Time
  field :confirmation_sent_at, type: Time
  field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  field :locked_at,       type: Time
  ## Paperclip image
  has_mongoid_attached_file :image, styles: { medium: "300x300", thumb: "100x100#", original: "1920x1680>" }
  validates_attachment_content_type :image, content_type: %w[image/jpeg image/jpg image/png]

  embeds_one :address
  embeds_many :skill_sets
  embeds_one :profile

  # default_scope -> { order("skill_set._id desc") } # TODO default scope
end
