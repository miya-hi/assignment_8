class PostMailer < ApplicationMailer
  def post_mail(post)
    @post = post
    mail to: "hitomikirarin0830m@yahoo.co.jp",subject: "投稿の確認メール"
  end
end
