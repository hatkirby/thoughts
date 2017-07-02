class Admin::DashboardController < Admin::AdminController
  before_action :set_section

  def index
  end

  private

    def set_section
      @section = "dashboard"
    end
end
