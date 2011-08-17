# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|

  # Define the primary navigation
  navigation.items do |primary|
    if current_user
 
      primary.item :home, t(:'home'), root_path, :class => 'None' 

      if current_user.admin?
        primary.item :users, t(:'users'), users_path
        primary.item :devices, t(:'devices'), devices_path
      end

      primary.item :rates, t(:'rates'), rates_path
      
      if current_user.device || current_user.admin?
        primary.item :outgoing_calls, t(:'outgoing_calls'), outgoing_calls_path
        primary.item :incomming_calls, t('incomming_calls'), incomming_calls_path
        primary.item :failed_calls, t(:'failed_calls'), failed_calls_path
        primary.item :invoices, t(:'consult'), consults_path
        primary.item :invoices, t(:'saved_expenses'), invoices_path
      end
      
      if current_user.admin?
        primary.item :csv_files, t(:"csv_files"), csv_files_path
      end
      
      primary.item :logout, t(:'logout'), destroy_user_session_url 
    end
  end

end
