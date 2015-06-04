class User < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :registered_applications       



  def admin?
    role == 'admin'
  end

  def moderator?
    role == 'moderator'
  end

end
