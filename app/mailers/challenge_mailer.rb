class ChallengeMailer < ActionMailer::Base
  default :from => SITE_SETTINGS[:Email]
  
  def challenge_friend(challenge)
    @challenge = challenge
    mail(:to => challenge.email, :subject => "You have been challenged")
  end
end
