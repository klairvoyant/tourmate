class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from Exception, :with => :handle_exceptions
  private
    def handle_exceptions(e)
    case e
    when ActiveRecord::RecordNotFound
      not_found
    else
      internal_error(e)
    end
  end
   def not_found
    # Just render view
    ErrorMailer.record_not_found.deliver
    render :template => "error_mailer/500", :status => 500
  end
  def internal_error(exception)
      ErrorMailer.support_notification.deliver
      render :template => "error_mailer/500", :status => 500
  end
  protected
  def local_request?
    false
  end
end