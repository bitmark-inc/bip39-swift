module Fastlane
  module Actions
    module SharedValues
      POD_SPEC_LINT_CUSTOM_VALUE = :POD_SPEC_LINT_CUSTOM_VALUE
    end

    class PodSpecLintAction < Action
      def self.run(params)
        # fastlane will take care of reading in the parameter and fetching the environment variable:
        sh "pod spec lint --allow-warnings"

        # Actions.lane_context[SharedValues::POD_SPEC_LINT_CUSTOM_VALUE] = "my_val"
      end

      def self.is_supported?(platform)
        # you can do things like
        # 
        #  true
        # 
        #  platform == :ios
        # 
        #  [:ios, :mac].include?(platform)
        # 

        [:ios, :mac, :linux].include?(platform)
      end
    end
  end
end
