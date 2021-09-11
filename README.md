# Create databases
```
> rails db:create
> rails readonly:db:create
```

# Migration for primary database
```
> rails db:migrate
```

# Import seed data for primary database
```
> rails db:seed  
```

# Migration for secondary database
```
> rails readonly:db:migrate
```

# Check User's count in primary database
```
> User.count
   (0.5ms)  SELECT COUNT(*) FROM "users"
=> 3
```

# Check User's count in secondary database
```
irb(main):003:0> Readonly::User.count
   (0.6ms)  SELECT COUNT(*) FROM "users"
=> 0
```

# We can only create a new user by User but Readonly::User
```
irb(main):001:0> user = Readonly::User.new(username: "midman", email: "midman@fiahub.com")
=> #<Readonly::User id: nil, username: "midman", email: "midman@fiahub.com", full_name: nil, password_digest: nil, role: nil, created_at: nil, updated_at: nil>
irb(main):002:0> user.save
ActiveRecord::ReadOnlyRecord (Readonly::User is marked as readonly)

irb(main):003:0> user = User.new(username: "midman", email: "midman@fiahub.com")
=> #<User id: nil, username: "midman", email: "midman@fiahub.com", full_name: nil, password_digest: nil, role: nil, created_at: nil, updated_at: nil>
irb(main):004:0> user.save
   (0.9ms)  BEGIN
  SQL (0.7ms)  INSERT INTO "users" ("username", "email", "created_at", "updated_at") VALUES ($1, $2, $3, $4) RETURNING "id"  [["username", "midman"], ["email", "midman@fiahub.com"], ["created_at", "2021-09-11 10:55:58.896467"], ["updated_at", "2021-09-11 10:55:58.896467"]]
   (0.9ms)  COMMIT
=> true
```

# Check connection config from models
```
irb(main):017:0> User.connection_config
=> {:adapter=>"postgresql", :encoding=>"unicode", :host=>"db", :username=>"postgres", :password=>"password", :pool=>5, :database=>"drp_development"}

irb(main):018:0> Readonly::User.connection_config
=> {:adapter=>"postgresql", :encoding=>"unicode", :host=>"db_readonly", :username=>"postgres", :password=>"password", :pool=>5, :database=>"drp_development"}
```
