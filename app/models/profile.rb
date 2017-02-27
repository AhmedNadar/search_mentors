class Profile < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :skills
  has_and_belongs_to_many :jobs
  has_and_belongs_to_many :industries

  has_attached_file :avatar, styles: { medium: "220x220>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


  scope :first_name, -> (first_name) { where first_name: first_name }
  scope :skills, lambda { |n| joins(:profiles_skills).("skills.id = ?", n) }
end
