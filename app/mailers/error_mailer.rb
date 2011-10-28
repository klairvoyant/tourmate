class ErrorMailer < ActionMailer::Base
   def support_notification()
	    
	    mail(:to => "john@klairvoyant.com",
	         :from => "contact@klairvoyant.com",
	         :subject => "Internal Server Error")
	 end
    def record_not_found()
	      mail(:to => "john@klairvoyant.com",
	         :from => "contact@klairvoyant.com",
	         :subject => "Record not found")
	 end
end
