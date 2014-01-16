class Project < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :status, presence: true

  has_many :documents
end
