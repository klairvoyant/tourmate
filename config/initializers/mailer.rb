ActionMailer::Base.smtp_settings= {
:enable_starttls_auto=> true,
:address	=>"smtp.gmail.com",
:port 		=>587,
:domain =>"klairvoyant.com",
:user_name=> "contact@klairvoyant.com",
:password =>"cochinkerala",
:authentication=>"plain"

}