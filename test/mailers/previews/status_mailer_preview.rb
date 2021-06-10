# Preview all emails at http://localhost:3000/rails/mailers/status_mailer
class StatusMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/status_mailer/status_changed_confirmation
  def status_changed_confirmation
    StatusMailer.status_changed_confirmation
  end

end
