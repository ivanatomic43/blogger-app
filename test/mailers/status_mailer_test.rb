require 'test_helper'

class StatusMailerTest < ActionMailer::TestCase
  test "status_changed_confirmation" do
    mail = StatusMailer.status_changed_confirmation
    assert_equal "Status changed confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
