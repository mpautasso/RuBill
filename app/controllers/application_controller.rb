class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery
  
  def call_rake(task, options = {})
    options[:rails_env] ||= Rails.env
    args = options.map { |n, v| "#{n.to_s.upcase}='#{v}'" }
    system "rake #{task} #{args.join(' ')} --trace 2>&1 >> #{Rails.root}/log/rake.log &"
  end

  def begin_of_association_chain(model)
    current_user.admin? ? model : current_user.device.send(model.to_s.tableize)
  end

  private

    def authenticate
      deny_access unless signed_in?
    end
    
    def require_admin
      unless current_user.admin?
        head(:forbidden)
      end
    end
    
    def check_device_existence
      redirect_to root_path, :notice => 'User has not device associate yet' unless current_user.device
    end

end
