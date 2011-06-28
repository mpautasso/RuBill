# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|

  # Define the primary navigation
  navigation.items do |primary|
    if current_user
 
      primary.item :home, 'Home', root_path, :class => 'None' 

      primary.item :users, 'Users', users_path
      
      primary.item :devices, 'Devices', devices_path

      primary.item :invoices, 'Invoices', invoices_path do |invoice|
        invoice.item :outgoing_calls, 'Outgoing Calls', outgoing_calls_path
        invoice.item :incomming_calls, 'Incomming Calls', incomming_calls_path
        invoice.item :failed_calls, 'Failed Calls', failed_calls_path
      end


      primary.item :outgoing_calls, 'Outgoing Calls', outgoing_calls_path
      primary.item :incomming_calls, 'Incomming Calls', incomming_calls_path
      primary.item :failed_calls, 'Failed Calls', failed_calls_path


      primary.item :logout, 'Logout', destroy_user_session_url 
    end
  end

end
