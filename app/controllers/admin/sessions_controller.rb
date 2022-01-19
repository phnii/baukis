class Admin::SessionsController < Admin::Base
  def new
    if current_administrator
      redirect_to :admin_root
    else
      @form = Admin::LoginForm.new
      render action: "new"
    end
  end

  def create
    @form = Admin::LoginForm.new(params[:admin_login_form])
    if @form.email.present?
      admin = Administrator.find_by(email: @form.email)
    end
    if Admin::Authenticator.new(admin).authenticate(@form.password)
      session[:administrator_id] = admin.id
      flash.notice = "ログインしました"
      redirect_to :admin_root
    else
      flash.now.alert = "メールアドレスまたはパスワードが正しくありません"
      render action: "new"
    end
  end

  def destroy
    session.delete(:administrator_id)
    flash.notice = "ログアウトしました"
    redirect_to :admin_root
  end
end
