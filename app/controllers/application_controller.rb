class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :footer

  protected
  def footer
    @footer = Refinery::Page.where(:slug => "footer").first
  end
end
