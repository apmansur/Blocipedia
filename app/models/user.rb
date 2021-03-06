class User < ActiveRecord::Base
  has_many :wikis, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_initialize :default_role
  enum role: [:standard, :premium, :admin]
  
  def default_role
    self.role ||= :standard
  end
end
