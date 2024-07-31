### Ruby API Wrapper - Cloudways
   
Easily connect to your Cloudways account through their API.
  
* Secure OAuth Cloudways API Authentication
  
#### Step 1 - Add to your application
  
    gem 'ruby_api_pack_cloudways'
    bundle install
    
#### Controller Example
    
    def index 
        @servers = RubyApiPackCloudways::Api::CwServer.cw_server_list
    end
  
#### Example on Index File

    <% @servers.each do |server| %>
        <p><%= server %></p>
    <% end %>
  
#### Intializer
  
Set the following initalizer in your application:
  
    RubyApiPackCloudways.configure do |config|
        config.api_url = Rails.application.credentials.dig(:cloudways, :api_url)
        config.api_path_token = Rails.application.credentials.dig(:cloudways, :api_path_token)
        config.api_email = Rails.application.credentials.dig(:cloudways, :api_email)
        config.api_key = Rails.application.credentials.dig(:cloudways, :api_key)
    end
  
Open your credentials.yml.enc with your editor of choice in this case using VSCode:
  
    EDITOR="code --wait" bin/rails credentials:edit
  
Add the following to your credentials.yml:
  
    cloudways:
        api_url: 'https://api.cloudways.com/api/v1'
        api_path_token: '/oauth/access_token'
        api_email: 'Your Cloudways Email'
        api_key: 'Your Cloudways API Key'
    
Some examples using your editor of choice to open your credentials.yml.enc:
    
    EDITOR="atom --wait" bin/rails credentials:edit
    
    EDITOR="gedit --wait" bin/rails credentials:edit
    
    EDITOR="vim" bin/rails credentials:edit
    
    EDITOR="nano" bin/rails credentials:edit
    
    EDITOR="emacs" bin/rails credentials:edit
    
    EDITOR="subl -n -w" bin/rails credentials:edit
    
    EDITOR="mate -w" bin/rails credentials:edit
  
  [![Gem Version](https://badge.fury.io/rb/ruby_api_pack_cloudways.svg)](https://badge.fury.io/rb/ruby_api_pack_cloudways)
