class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post

    belongs_to :parent, class_name: "Comment", optional: true
    has_many :replies, class_name: "Comment", foreign_key: :parent_id, dependent: :destroy

    has_many :likes, dependent: :destroy

    def reply?
        parent_id.present?
    end

    def depth_level
        parent ? parent.depth_level + 1 : 0
    end
end
