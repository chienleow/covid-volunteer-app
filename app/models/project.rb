class Project < ActiveRecord::Base
    belongs_to :user

    validates :title, :image_url, :information, presence: true
end
