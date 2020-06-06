class ChallengeMailer < ActionMailer::Base
  default from: "noreply@optimised.today"

  def challenge_friend(challenge)
    @challenge = challenge
    mail(to: challenge.email, subject: 'You have been challenged')
  end
end
