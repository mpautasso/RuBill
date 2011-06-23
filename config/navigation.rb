# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|

  # Define the primary navigation
  navigation.items do |primary|
    if current_user
 
      primary.item :home, 'Home', root_path, :class => 'None' 

      primary.item :users, 'Users', users_path

      primary.item :invoices, 'Invoices', invoices_path do |invoices|
        invoices.item :items, 'Items', items_path
      end

      primary.item :calls, 'Calls', calls_path do |calls|
        calls.item :outgoing, 'Outgoing Calls', outgoing_calls_path
        calls.item :incomming_calls, 'Incomming Calls', incomming_calls_path
        calls.item :failed_calls, 'Failed Calls', failed_calls_path
      end
    
      primary.item :logout, 'Logout', destroy_user_session_url
 
    end
  end

end
