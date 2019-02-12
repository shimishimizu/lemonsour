class InformationImage < ApplicationRecord
	belongs_to :information
	attachment :information_image
end