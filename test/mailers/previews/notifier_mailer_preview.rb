# Preview all emails at http://localhost:3000/rails/mailers/notifier_mailer
class NotifierMailerPreview < ActionMailer::Preview
  def welcome

  @user = User.create(email: 'test', password: '123', password_confirmation: '123')

    NotifierMailer.with(user: @user).welcome
end
end
