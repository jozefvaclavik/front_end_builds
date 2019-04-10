require_dependency "front_end_builds/application_controller"

module FrontEndBuilds
  class AdminController < ApplicationController

    def index
      # We need to pass the url which the host app has mounted the
      # engine to into index.html.erb, so the ember app's router
      # will work appropriately.

      # Trim trailing slash marks
      @base_url = admin_path[1..-2]
      @environment = {
        "modulePrefix":"admin",
        "podModulePrefix":"admin/pods",
        "environment":"production",
        "baseURL":@base_url,
        "locationType":"auto",
        "EmberENV":{"FEATURES":{}},
        "APP":{
          "name":"admin",
          "version":"0.0.0.1d1b7faf"
        },
        "contentSecurityPolicyHeader":"Content-Security-Policy-Report-Only",
        "contentSecurityPolicy":{
          "default-src":"'none'",
          "script-src":"'self'",
          "font-src":"'self'",
          "connect-src":"'self'",
          "img-src":"'self'",
          "style-src":"'self'",
          "media-src":"'self'"
        },
        "ember-cli-mirage":{"usingProxy":false},
        "exportApplicationGlobal":false
      }
    end

  end
end
