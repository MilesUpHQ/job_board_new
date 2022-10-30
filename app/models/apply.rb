class Apply < ApplicationRecord
    belongs_to :job

    has_one_attached :resume
    validates :resume, presence:true
    validate :document_type

    scope :filter_by_accept, -> { where(:status => "accept")}
    scope :filter_by_reject, -> { where(:status => "reject")}

    private

    def document_type
        if resume.attached? && !resume.content_type.in?(%w(application/msword application/pdf))
        errors.add(:resume, 'Must be a PDF or a DOC file')
        end
    end
end
