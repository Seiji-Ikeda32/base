class GuestsController < ApplicationController
   def new_guest
   　user = User.find_or_create_by!(email: 'guest@example.com') do |user|
     user.password = SecureRandom.urlsafe_base64
   end
   　sign_in user
   　redirect_to guests_guest_sign_in_path, notice: 'ゲストユーザーとしてログインしました。'
 　end
end
