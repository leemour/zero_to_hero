module FeatureMacros
  def sign_in(user)
    visit new_admin_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Sign in"
  end

  def sign_out
    click_on "Sign out"
  end
end
