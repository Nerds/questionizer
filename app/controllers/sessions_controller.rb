class SessionsController < ApplicationController
  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']
    @authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
    if @authorization
      user = @authorization.user
      session[:user_id] = user.id
      redirect_to root_url
    else
      user = User.new :name => auth_hash['extra']['raw_info']['name'], :email => auth_hash['extra']['raw_info']['email'], :login => auth_hash['extra']['raw_info']['login']
      user.authorizations.build :provider => auth_hash["provider"], :uid => auth_hash["uid"], :token => auth_hash['credentials']['token']
      user.save
      session[:user_id] = user.id
      redirect_to root_url
    end
  end

  def failure
    render :text => "Sorry, but you didn't allow access to our app!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url 
  end

end
