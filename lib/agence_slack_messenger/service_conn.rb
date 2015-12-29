require 'curb'
require 'json'
module AgenceSlackMessenger
  class ServiceConn
    CONFIG_FILE = File.expand_path(File.dirname(__FILE__) + '../../../config/slack.yml')
    def self.incoming_slack(params, http_url = nil)
      if http_url.nil?
        webhook = YAML::load_file(AgenceSlackMessenger::ServiceConn::CONFIG_FILE)['webhooks']
        http_url = webhook["incoming"]
      end

      http = Curl.post(http_url,params.to_json)
      http.body_str
    end

    def self.http_post(http_url, params = nil)
      http = Curl.post(http_url, params.nil? ? {:token => ENV["SLACK_API_TOKEN"]} : params)
      JSON.parse(http.body_str)
    end

    def self.http_post_slack(http_url)
      http = Curl.post(http_url, {:token => ENV["SLACK_API_TOKEN"]})
      JSON.parse(http.body_str)
    end

    def self.get_url_caol(url)
      ENV["CAOL_URL_SERVICE"]+url
    end

    def self.get_url_intranet(url)
      ENV["INTRANET_URL"]+url
    end

    def self.get_params_caol(params)
      params[:token] = ENV["CAOL_INTRANET_TOKEN"]
      params
    end

  end
end
