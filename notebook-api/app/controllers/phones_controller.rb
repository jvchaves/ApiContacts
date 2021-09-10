class PhonesController < ApplicationController
  before_action :set_phones
  def show
    render json: @phones
  end

  private

  def set_phones
    params[:contact_id].present? ? @phones = Contact.find(params[:contact_id]).phones : @phones = Phone.where(id: params[:id])
    @phones
  end
end
