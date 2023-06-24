module SignInSupport
  def sign_in(user)
     # サインインページへ移動する
     visit root_path
     # ログインしていない場合、サインインページに遷移していることを確認する
     expect(current_path).to eq new_user_session_path
     # すでに保存されているユーザーのemailとpasswordを入力する
     fill_in'Email',with: user.email
     fill_in'Password',with: user.password
     # ログインボタンをクリックする
     click_on "Log in"
     sleep 1
     # トップページに遷移していることを確認する
     expect(current_path).to (eq root_path)
  end
end