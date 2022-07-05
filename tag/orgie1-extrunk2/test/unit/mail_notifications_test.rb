require 'test_helper'

class MailNotificationsTest < ActionMailer::TestCase
  test "signup" do
    @expected.subject = 'MailNotifications#signup'
    @expected.body    = read_fixture('signup')
    @expected.date    = Time.now

    assert_equal @expected.encoded, MailNotifications.create_signup(@expected.date).encoded
  end

  test "forgot_password" do
    @expected.subject = 'MailNotifications#forgot_password'
    @expected.body    = read_fixture('forgot_password')
    @expected.date    = Time.now

    assert_equal @expected.encoded, MailNotifications.create_forgot_password(@expected.date).encoded
  end

  test "statistiche" do
    @expected.subject = 'MailNotifications#statistiche'
    @expected.body    = read_fixture('statistiche')
    @expected.date    = Time.now

    assert_equal @expected.encoded, MailNotifications.create_statistiche(@expected.date).encoded
  end

end
