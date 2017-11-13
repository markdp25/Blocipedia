class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :wikis, dependent: :destroy
  has_many :collaborators, dependent: :destroy

  before_save { self.email = email.downcase }
  before_save {self.role ||= :standard }

  enum role: [:standard, :premium, :admin]
  after_initialize :set_standard, :if => :new_record?

  def set_standard
    self.role ||= :standard
  end
end
