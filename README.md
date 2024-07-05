### Ruby API Wrapper - Cloudways
   
Easily connect to your Cloudways account through their API.
  
* Secure OAuth Cloudways API Authentication
  
#### Step 1 - Add to your application
  
    gem 'ruby_api_pack_cloudways'
    bundle install
    
#### Controller Example
    
    # Load Gems & Files
    require "ruby_api_pack_cloudways"

    def index
        @provider_list = RubyApiPackCloudways::Api::CwLists.cw_provider_list
    end
  
#### Example on Index File

    <% @provider_list.each do |provider| %>
        <%= provider["name"] %>
    <% end %>
  
#### Variables
  
Set the following environment variables in your application:
  
    export PHCDEV_API_CLOUDWAYS_EMAIL=your_cloudways_email_login
    export PHCDEV_API_CLOUDWAYS_KEY=api_key_provided_by_cloudways
  
These variables should be configured with your Cloudways email login and API key provided by Cloudways.
  