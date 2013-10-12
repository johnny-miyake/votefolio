class User < ActiveRecord::Base
  devise :omniauthable, omniauth_providers: [:facebook]
  has_many :polls, dependent: :destroy
  has_many :votes, dependent: :destroy

  class << self
    def find_for_facebook_oauth auth, signed_in_resource = nil
      user = User.where(provider: auth.provider, uid: auth.uid).first
      unless user
        user = User.create(
          name: auth.extra.raw_info.name,
          provider: auth.provider,
          uid: auth.uid,
          email: auth.info.email,
          password: Devise.friendly_token[0, 20])
      end
      user
    end

    def new_with_session params, session
      super.tap do |user|
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
      end
    end
  end

  private
  def user_params
    params.require(:user).permit :provider, :uid, :name
  end
end

