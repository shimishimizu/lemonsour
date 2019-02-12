class Information < ApplicationRecord
	has_many :information_images, dependent: :destroy
	accepts_attachments_for :information_images, attachment: :information_image

end
