### Ruby API Wrapper - Cloudways
     
Early Release. Beta 5.
   
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

    PHCDEV_API_CLOUDWAYS_EMAIL = Your Cloudways Email Login
    PHCDEV_API_CLOUDWAYS_KEY = API Key Provided by Cloudways
