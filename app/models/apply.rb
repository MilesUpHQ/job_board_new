class Apply < ApplicationRecord
    belongs_to :job

    has_one_attached :resume
    validates :resume, presence:true

    scope :filter_by_accept, -> { where(:status => "accept")}
    scope :filter_by_reject, -> { where(:status => "reject")}
end
