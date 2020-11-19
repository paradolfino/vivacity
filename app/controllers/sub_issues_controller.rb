class SubIssuesController < ApplicationController
  before_action :set_sub_issue, only: [:show, :edit, :update, :destroy]

  # GET /sub_issues
  # GET /sub_issues.json
  def index
    @sub_issues = SubIssue.all
  end

  # GET /sub_issues/1
  # GET /sub_issues/1.json
  def show
  end

  # GET /sub_issues/new
  def new
    @sub_issue = SubIssue.new
  end

  # GET /sub_issues/1/edit
  def edit
  end

  # POST /sub_issues
  # POST /sub_issues.json
  def create
    @sub_issue = SubIssue.new(sub_issue_params)

    respond_to do |format|
      if @sub_issue.save
        format.html { redirect_to @sub_issue, notice: 'Sub issue was successfully created.' }
        format.json { render :show, status: :created, location: @sub_issue }
      else
        format.html { render :new }
        format.json { render json: @sub_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_issues/1
  # PATCH/PUT /sub_issues/1.json
  def update
    respond_to do |format|
      if @sub_issue.update(sub_issue_params)
        format.html { redirect_to @sub_issue, notice: 'Sub issue was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_issue }
      else
        format.html { render :edit }
        format.json { render json: @sub_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_issues/1
  # DELETE /sub_issues/1.json
  def destroy
    @sub_issue.destroy
    respond_to do |format|
      format.html { redirect_to sub_issues_url, notice: 'Sub issue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_issue
      @sub_issue = SubIssue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sub_issue_params
      params.require(:sub_issue).permit(:name, :description, :status, :team_member_id, :project_id, :organization_id, :team_id, :issue_id)
    end
end
