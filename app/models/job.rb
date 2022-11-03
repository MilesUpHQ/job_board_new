class Job < ApplicationRecord
    has_many :applies
    has_rich_text :description 
    belongs_to :user
    mount_uploader :avatar, AvatarUploader
    has_one_attached :resume
    validates_length_of :title, maximum: 25, allow_blank: false
    validates :description,:job_author,:url,:email,presence: true
    validates :url,presence: true, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])

    JOB_TYPES =["Full-time employment", "Part-time", "short-timeContract", "Freelance", "Internship","Volunteer contribution","Partner for a venture",]
    CATEGORY  =["Programming","Interaction Design", "Graphic Design","Electronics","Information Security",
                 "Testing/Quality Assurance","IT/System Administration","Business/Management",
                "Writer/Editor","Customer Support","Mobile(iPhone,Android,Other)","Office Administation"]

end
