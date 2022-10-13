class Relationship < ApplicationRecord
  belongs_to :follewer, class_name: "User"
  belongs_to :follewed, class_name: "User"
end
