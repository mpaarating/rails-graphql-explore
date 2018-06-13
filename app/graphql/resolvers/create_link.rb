# This is some top level comment
module Resolvers
  # Creates a Link
  class CreateLink < GraphQL::Function
    # arguments passed as "args"
    argument :description, !types.String
    argument :url, !types.String

    # return type from the mutation
    type Types::LinkType

    # the mutation method
    # _obj - is parent object, which in this case is nil
    # args - are the arguments passed
    # ctx - is the GraphQL context
    def call(_obj, args, ctx)
      Link.create!(
        description: args[:description],
        url: args[:url],
        user: ctx[:current_user]
      )
    end
  end
end
