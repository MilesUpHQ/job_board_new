class JobApplicationsController < ApplicationController
  before_action :set_job
  before_action :authenticate_user!, only:[:index, :new, :show]
  # before_action :check_user_job, except: %i[ new create ]
  before_action :set_apply, only: %i[ show accept reject ]

  def index
  end

  def new
    @job_application = @job.job_applications.new()
  end

    def create
      @job_application = @job.job_applications.new(apply_params)
      if job_application
        redirect_to jobs_path,flash: {notice: "JOB IS APPLIED SUCCESSFULLY"}
      else 
        render 'new'
      end
    end

    def show
    end

    def accepted
      @job_applications = @job.job_applications.filter_by_accept
    end

    def rejected
      @job_applications = @job.job_applications.filter_by_reject
    end

    def reject
     job_applications = "reject"
      if job_application
        respond_to do |format|
          format.html { redirect_to job_job_applications_path, notice: "The application is rejected" }
          format.json { head :no_content }
        end
      end
    end

    def accept
     job_applications = "accept"
      if job_application
        respond_to do |format|
          format.html { redirect_to job_job_applications_path, notice: "The application is accepted" }
          format.json { head :no_content }
        end
      end
    end

    private

    def apply_params
      params.require(:apply).permit(:name, :phonenumber,:address,:email,:resume, :status)
    end

    def set_job
      @job = Job.find(params[:job_id])
    end

    def set_apply
     job_application job.job_applications.find(params[:id])
    end
end
