class OfferMailer < ActionMailer::Base
  default from: "no-reply@mu-cre.com"

  def inform_offer(offer)
    @offerer_user = offer.offerer_user
    @offered_user = offer.offered_user
    @offer = offer
    mail(:to => @offered_user.email,
         :subject => "[MuseumCreated.com] Offered from #{@offerer_user.username}")
  end

  def inform_accepted(project, offer)
    @offerer_user = offer.offerer_user
    @offered_user = offer.offered_user
    @project = project
    mail(:to => @offerer_user.email,
         :subject => "[MuseumCreated.com] Offer was accepted by #{@offered_user.username}")
  end

  def inform_comment(project, user)
    @project = project
    mail(:to => user.email,
         :subject => "[MuseumCreated.com] #{@project.title} project was updated")
  end
end
