module ApplicationHelper

  def gravatar_for(user, options = { size: 80, display: 'block' })
    # include MD5 gem, should be part of standard ruby install
    require 'digest/md5'
    
    # get the email from URL-parameters or what have you and make lowercase
    email_address = user.email.downcase
    
    # create the md5 hash
    hash = Digest::MD5.hexdigest(email_address)
    size = options[:size]
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    css_display = options[:display] ? "d-#{options[:display]}" : 'd-block'
    image_tag(gravatar_url, alt: user.username, class: "rounded shadow mx-auto #{css_display}")
  end


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  def logged_in?
    !!current_user
  end


end
