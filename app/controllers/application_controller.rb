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

  def build_date_from_params(field_name, params)
    Date.new(params["#{field_name.to_s}(1i)"].to_i, params["#{field_name.to_s}(2i)"].to_i, params["#{field_name.to_s}(3i)"].to_i)
  end

  private

    def authenticate
      deny_access unless signed_in?
    end
    
end
