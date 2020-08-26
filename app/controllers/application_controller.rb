class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ロケール振り分けを全てのアクションで実行
  around_action :switch_locale

  # params値のロケールによる振り分け
  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  # url_for関係メソッドでロケールを設定するよう上書き
  def default_url_options
    { locale: I18n.locale }
  end

  private
   def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
   end

end
