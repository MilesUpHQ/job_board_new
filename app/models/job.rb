class Job < ApplicationRecord
    belongs_to :user
    mount_uploader :avatar, AvatarUploader
    has_one_attached :resume
    validates :title,presence: true
    validates :description,presence: true
    validates :url,presence: true, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
    
    JOB_TYPES =["Full-time", "Part-time", "Contract", "Freelance"]
    

end
