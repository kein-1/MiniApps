export const typeDefs = `#graphql
  # Comments in GraphQL strings (such as this one) start with the hash (#) symbol.

    # The "Query" type is special: it lists all of the available queries that
    # clients can execute, along with the return type for each. In this
    # case, the "books" query returns an array of zero or more Books (defined above).
    type Query {
		owners: [Owner]
		pets: [Pet]
	}	

	type Owner {
		id: ID!
		first: String!
		last: String!
		pets: [Pet]
	}

    type Pet {
        id: ID!
        name: String!
        breed: String!
		ownerId: ID!
    }
`
