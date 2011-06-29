class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery
  
  ActiveScaffold.set_defaults do |config|
    config.ignore_columns.add [:created_at, :updated_at]
    config.theme = :blue

    config.list.per_page = 20     
  end

  def call_rake(task, options = {})
    options[:rails_env] ||= Rails.env
    args = options.map { |n, v| "#{n.to_s.upcase}='#{v}'" }
    system "rake #{task} #{args.join(' ')} --trace 2>&1 >> #{Rails.root}/log/rake.log &"
  end

  
  private

    def authenticate
      deny_access unless signed_in?
    end
    
end
