class StatusMailer < ApplicationMailer

  

  def status_changed_confirmation(email)

    #@author = author
    mail to: email, subject: "Status changed confirmation"
  end


end
