class AppliesController < ApplicationController
  before_action :set_job

  def index
    unless @job.user_id == current_user.id
      redirect_to root_path and return
    end
  end

  def new
    unless @job.user_id == current_user.id
      redirect_to root_path and return
    end
    @apply = @job.applies.new()
  end

    def create
      unless @job.user_id == current_user.id
        redirect_to root_path and return
      end
      @apply = @job.applies.new(apply_params)
      if @apply.save
        redirect_to jobs_path,flash: {notice: "JOB IS APPLIED SUCCESSFULLY"}
      end
    end

    def show
      unless @job.user_id == current_user.id
        redirect_to root_path and return
      end
      @apply =  @job.applies.find(params[:id])
    end

    def accepted
      unless @job.user_id == current_user.id
        redirect_to root_path and return
      end
      @applies = @job.applies.filter_by_accept
    end

    def rejected
      unless @job.user_id == current_user.id
        redirect_to root_path and return
      end
      @applies = @job.applies.filter_by_reject
    end

    def reject
      unless @job.user_id == current_user.id
        redirect_to root_path and return
      end
      @apply = @job.applies.find(params[:id])
      @apply.status = "reject"
      if @apply.save
        redirect_to job_applies_path and return
      end
      respond_to do |format|
        format.html { redirect_to job_applies_path, notice: "The application is rejected" }
        format.json { head :no_content }
      end
    end

    def accept
      unless @job.user_id == current_user.id
        redirect_to root_path and return
      end
      @apply = @job.applies.find(params[:id])
      @apply.status = "accept"
      if @apply.save
        redirect_to job_applies_path and return
      end
      respond_to do |format|
        format.html { redirect_to job_applies_path, notice: "application is accepted" }
        format.json { head :no_content }
      end
    end

    private

    def apply_params
      params.require(:apply).permit(:name, :phonenumber,:address,:email,:resume, :status)
    end

    def set_job
      @job = Job.find(params[:job_id])
    end
end
