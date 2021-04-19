class WeeklyEmailJob < ApplicationJob
  queue_as :default

  def perform
    # Do something later
    email_list = EmailList.all
    edition = Edition.last
    email_list.each do |cc|
      puts cc.email
      NotifierMailer.with({ email: cc.email, link: edition.pdf }).weekly.deliver_now
    end
  end
end
