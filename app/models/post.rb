class Post < ApplicationRecord
    validates :title, presence: true, length: {minimum: 5, maximum: 100}
    validates :description, presence: true, length: {minimum: 5, maximum: 200}
    validates :keywords, presence: true, length: {minimum: 2, maximum:25}

    has_many_attached :images
    belongs_to :user

    has_many :comments, -> { where(parent_id: nil) }, dependent: :destroy
    has_many :all_comments, class_name: "Comment", foreign_key: :parent_id, dependent: :destroy

    has_many :likes
    has_many :liked_users, through: :likes, source: :user

    def comments_count
      comments.size
    end
    before_create :randomize_id
         private
         def randomize_id
          begin
            self.id = SecureRandom.random_number(1_00_000_000)
          end while User.where(id: self.id).exists?
         end
end
