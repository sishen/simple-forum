class MailObserver < ActiveRecord::Observer
  observe :identity

  def after_commit(identity)
    if identity.send(:transaction_include_action?, :create)
      IdentityMailer.delay.confirm_email(identity.id)
    end
  end
end
