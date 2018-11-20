
class PayController < ApplicationController
protect_from_forgery except: :index
  def index
    
    Payjp.api_key = "sk_test_2d362d61f3ecf24bb51302fe"
    charge = Payjp::Charge.create(:amount => 3500,:card => params['payjp-token'],:currency => 'jpy')
  end

end
