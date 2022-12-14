require "application_system_test_case"

class JobsTest < ApplicationSystemTestCase
  setup do
    @job = jobs(:one)
  end

  test "visiting the index" do
    visit jobs_url
    assert_selector "h1", text: "Jobs"
  end

  test "creating a Job" do
    visit jobs_url
    click_on "New Job"

    fill_in "Apply url", with: @job.apply_url
    fill_in "Description", with: @job.description
    fill_in "Job author", with: @job.job_author
    fill_in "Job type", with: @job.job_type
    fill_in "Location", with: @job.location
    check "Remoke ok" if @job.remoke_ok
    fill_in "Title", with: @job.title
    fill_in "Url", with: @job.url
    click_on "Create Job"

    assert_text "Job was successfully created"
    click_on "Back"
  end

  test "updating a Job" do
    visit jobs_url
    click_on "Edit", match: :first

    fill_in "Apply url", with: @job.apply_url
    fill_in "Description", with: @job.description
    fill_in "Job author", with: @job.job_author
    fill_in "Job type", with: @job.job_type
    fill_in "Location", with: @job.location
    check "Remoke ok" if @job.remoke_ok
    fill_in "Title", with: @job.title
    fill_in "Url", with: @job.url
    click_on "Update Job"

    assert_text "Job was successfully updated"
    click_on "Back"
  end

  test "destroying a Job" do
    visit jobs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Job was successfully destroyed"
  end
end
