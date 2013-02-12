class IdentityMailer < ActionMailer::Base
  default from: '"Dingding Ye" <yedingding@gmail.com>'

  def confirm_email(identity_id)
    @identity = Identity.find(identity_id)
    mail(
      to: @identity.email,
      subject: "Please confirm your email address"
    )
  end
end
