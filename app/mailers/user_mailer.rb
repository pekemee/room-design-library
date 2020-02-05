class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end

  def comment_notice(user,comment)
    @user = user
    @comment = comment
    @micropost = @comment.micropost
    mail to: user.email, subject: "あなたの写真にコメントがありました。"
  end
end
