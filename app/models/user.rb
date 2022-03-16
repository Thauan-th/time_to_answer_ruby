class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :user_profile
  accepts_nested_attributes_for :user_profile , reject_if: :all_blank
  after_create :set_statistic
#validaçao
  validates :first_name , presence: true , length: {minimum:5} ,on: :update

#virtual atributo
  def full_name
    [self.first_name,self.last_name].join(' ')
  end
  private 
  def set_statistic
    AdminStatistic.set_event(AdminStatistic::EVENTS[:total_users])
  end
end
