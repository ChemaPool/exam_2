class UserMailerPreview < ActionMailer::Preview
  def new_user
    UserMailer.with(user: User.first).new_user
  end
end