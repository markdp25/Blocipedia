class Wiki < ApplicationRecord
  belongs_to :user
  has_many :users, through: :collaborators
  has_many :collaborators, dependent: :destroy

  default_scope { order('created_at DESC') }

  scope :visible_to, -> (user) do
    return all if user.premium? || user.admin?
    where(private: [false, nill])
  end

  validates :title, length: { minimum: 2 }, presence: true
  validates :body, length: { minimum: 5 }, presence: true
end
