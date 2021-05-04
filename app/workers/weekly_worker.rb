class WeeklyWorker
  include Sidekiq::Worker

  def perform
    email_list = EmailList.all
    edition = Edition.last
    email_list.each do |cc|
      puts cc.email
      NotifierMailer.with({ email: cc.email, link: edition.pdf }).weekly.deliver_now
  end
end
end
