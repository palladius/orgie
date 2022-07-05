class MailNotifications < ActionMailer::Base
  

  def signup(sent_at = Time.now)
    subject    'MailNotifications#signup'
    recipients ''
    from       ''
    sent_on    sent_at
    
    body       :greeting => 'Hi,'
  end

  def forgot_password(sent_at = Time.now)
    subject    'MailNotifications#forgot_password'
    recipients ''
    from       ''
    sent_on    sent_at
    
    body       :greeting => 'Hi,'
  end

  def statistiche(sent_at = Time.now)
    subject    'MailNotifications#statistiche'
    recipients ''
    from       ''
    sent_on    sent_at
    
    body       :greeting => 'Hi,'
  end

end
