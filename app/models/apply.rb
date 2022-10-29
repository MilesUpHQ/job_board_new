class Apply < ApplicationRecord
    has_one_attached :resume
    validates :resume, presence:true

    scope :filter_by_accept, -> { where(:status => "accept")}
    scope :filter_by_reject, -> { where(:status => "reject")}
end
