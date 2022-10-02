# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(username: 'thongle', email: "thong@fiahub.com")
# User.create(username: 'thinhbui', email: "thinhdbui@fiahub.com")
# User.create(username: 'nhu', email: "nhu@fiahub.com")

user_balance = user.user_balances.create(coin: "BTC", balance: 0)
