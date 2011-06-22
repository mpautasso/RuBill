# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|

  # Define the primary navigation
  navigation.items do |primary|
    if current_user
      primary.item :item, 'Home', root_path, :class => 'None' do |tickets|

        primary.item :users, 'Users', users_path

        primary.item :invoices, 'Invoices', invoices_path do |invoices|
          invoices.item :items, 'Items', items_invoices_path
        end

        primary.item :rates, 'Rates', rates_path
        primary.item :incomming_calls, 'Incomming Calls', incomming_calls_path
        primary.item :outgoing_calls, 'Outgoing Calls', outgoing_calls_path

        primary.item :logout, 'Logout', destroy_user_session_url
      end
    end
  end

end
