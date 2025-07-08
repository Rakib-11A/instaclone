class Post < ApplicationRecord
    validates :title, presence: true, length: {minimum: 5, maximum: 100}
    validates :description, presence: true, length: {minimum: 5, maximum: 200}
    validates :keywords, presence: true, length: {minimum: 2, maximum:25}

    has_many_attached :images
    belongs_to :user
    has_many :comments
    has_many :likes

    before_create :randomize_id
         private
         def randomize_id
          begin
            self.id = SecureRandom.random_number(1_00_000_000)
          end while User.where(id: self.id).exists?
         end
end
