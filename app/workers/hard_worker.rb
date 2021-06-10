class HardWorker
  include Sidekiq::Worker

  def perform(email)
    # Do something
    StatusMailer.status_changed_confirmation(email).deliver

  end

  
end
