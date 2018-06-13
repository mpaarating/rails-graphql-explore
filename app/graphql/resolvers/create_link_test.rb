required 'test_helper'

# Resolvers module
module Resolvers
  # Create link test class
  class CreateLinkTest < ActiveSupport::TestCase
    def perform(args = {})
      Resolvers::CreateLink.new.call(nil, args, {})
    end

    test 'creating new link' do
      link = perform(
        url: 'http://example.com',
        description: 'description'
      )

      assert link.persisted?
      assert_equal link.description, 'description'
      assert_equal link.url, 'http://example.com'
    end
  end
end
