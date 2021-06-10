class ArticleMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.article_mailer.confirm_create.subject
  #
  def confirm_create(email)
    

    mail to: email, subject: "Article created confirmation"
  end
end
