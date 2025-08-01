class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :posts
         has_many :comments, dependent: :destroy
         has_one_attached :avatar

         has_many :likes, as: :likeable, dependent: :destroy


         before_create :randomize_id
         
         private
         def randomize_id
          begin
            self.id = SecureRandom.random_number(1_00_000_000)
          end while User.where(id: self.id).exists?
         end
end
