class IssuecloserController < AdminController
  unloadable

  def index
    @issues_all_count = Issue.count
    @issues_to_change = Issue.where('status_id=?', Setting.plugin_issuecloser['issues_status_from']).where("updated_on < ?", Setting.plugin_issuecloser['auto_close_after_days'].to_i.days.ago).order(:created_on)
    @issues_to_change_count = @issues_to_change.count
    @issues_to_change_paginated = @issues_to_change.includes(:project, :tracker, :priority, :status).page params[:page]
    @status_to = IssueStatus.find(Setting.plugin_issuecloser['issues_status_to'])
  end

  def update
    if params[:id]
      @issue = Issue.find(params[:id])
      if @issue.status_id == Setting.plugin_issuecloser['issues_status_from'].to_i
        @issue.update(status_id: Setting.plugin_issuecloser['issues_status_to'])
        flash[:notice] = l(:notice_issue_status_updated)
      end
    end
    redirect_to :issuecloser
  end
end
