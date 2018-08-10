module Renderable
  extend ActiveSupport::Concern

  def render_api(object, status = :ok)
    if object&.blank? || (object.respond_to?(:errors) && object.errors.present?)
      render json: { error: { status: 422, message: (object.present? && object.errors.full_messages.to_sentence) || I18n.t("default_error"),
                              errors: object.try(:errors) || I18n.t("default_error") } }, status: 422
    else
      render json: object, status: status
    end
  end
end
