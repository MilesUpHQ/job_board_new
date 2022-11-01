class AppliesController < ApplicationController
  before_action :set_job
  before_action :authenticate_user!, only:[:index, :new, :show]
  # before_action :check_user_job, except: %i[ new create ]
  before_action :set_apply, only: %i[ show accept reject ]

  def index
  end

  def new
    @apply = @job.applies.new()
  end

    def create
      @apply = @job.applies.new(apply_params)
      if @apply.save
        redirect_to jobs_path,flash: {notice: "JOB IS APPLIED SUCCESSFULLY"}
      else 
        render 'new'
      end
    end

    def show
    end

    def accepted
      @applies = @job.applies.filter_by_accept
    end

    def rejected
      @applies = @job.applies.filter_by_reject
    end

    def reject
      @apply.status = "reject"
      if @apply.save
        respond_to do |format|
          format.html { redirect_to job_applies_path, notice: "The application is rejected" }
          format.json { head :no_content }
        end
      end
    end

    def accept
      @apply.status = "accept"
      if @apply.save
        respond_to do |format|
          format.html { redirect_to job_applies_path, notice: "The application is accepted" }
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
      @apply =  @job.applies.find(params[:id])
    end
end
