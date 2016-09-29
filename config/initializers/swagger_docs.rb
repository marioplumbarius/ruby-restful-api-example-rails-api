module Swagger
  module Docs
    class Config
      # Inheriting from a custom Api controller
      def self.base_api_controller
        ActionController::API
      end

      # Transforming the path variable
      def self.transform_path(path, _api_version)
        "docs/#{path}"
      end
    end
  end
end

Swagger::Docs::Config.register_apis(
  '1.0' => {
    swagger_version: '2.0', # default is 1.2
    # the output location where your .json files are written to
    api_file_path: 'public/docs',
    # the URL base path to your API
    base_path: "http://localhost:#{ENV['PORT']}",
    # if you want to delete all .json files at each generation
    clean_directory: true,
    # add custom attributes to api-docs
    attributes: {
      info: {
        'title' => 'Swagger Sample App',
        'description' => 'This is a sample description.',
        'termsOfServiceUrl' => 'http://helloreverb.com/terms/',
        'contact' => 'apiteam@wordnik.com',
        'license' => 'Apache 2.0',
        'licenseUrl' => 'http://www.apache.org/licenses/LICENSE-2.0.html'
      }
    }
  }
)
