class DashboardController < ApplicationController
  before_action :authenticate_user!

  def show
    authorize :dashboard

    @volunteers = policy_scope(User.volunteer).decorate
    @casa_cases = policy_scope(CasaCase.all)
    @case_contacts = policy_scope(CaseContact.all).order(occurred_at: :desc).decorate
  end
end
