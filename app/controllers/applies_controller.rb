class AppliesController < ApplicationController

  def index
    @job = Job.find(params[:job_id])
  end

        def new
          @job = Job.find(params[:job_id])
          @apply = @job.applies.new()
        end

        def create
          @job = Job.find(params[:job_id])
          @apply = @job.applies.new(apply_params)
          if @apply.save
            redirect_to jobs_path,flash: {notice: "JOB IS APPLIED SUCCESSFULLY"}
         end
        end
        def show
          @apply =  Apply.find(params[:id])
        end

        def accepted
          @job = Job.find(params[:job_id])
          @applies = @job.applies.filter_by_accept
        end

        def rejected
          @job = Job.find(params[:job_id])
          @applies = @job.applies.filter_by_reject
        end

        def reject
          @apply = Apply.find(params[:id])
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
          @apply = Apply.find(params[:id])
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


end
