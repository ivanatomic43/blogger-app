require 'test_helper'

class ArticleMailerTest < ActionMailer::TestCase
  test "confirm_create" do
    mail = ArticleMailer.confirm_create
    assert_equal "Confirm create", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
