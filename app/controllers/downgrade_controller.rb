class DowngradeController < ApplicationController
  def new
  end

  def create
    current_user.update_attribute(:role, 'standard')

    flash[:notice] = "#{current_user.email} you're account has been downgraded"
    redirect_to edit_user_registration_path
  end
end
