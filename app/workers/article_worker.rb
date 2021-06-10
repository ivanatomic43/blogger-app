class ArticleWorker

    include Sidekiq::Worker

    def perform(email)
      # Do something
      ArticleMailer.confirm_create(email).deliver
  
    end


end