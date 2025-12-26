use restaurantdb

db.restaurant.insertMany([
  {restaurant_id:1, name:"SpiceHub", town:"Delhi", cuisine:"Indian", score:8, address:{zipcode:"10001"}},
  {restaurant_id:2, name:"Foodies", town:"Mumbai", cuisine:"Italian", score:12, address:{zipcode:"40002"}},
  {restaurant_id:3, name:"Tandoor", town:"Delhi", cuisine:"Indian", score:9, address:{zipcode:"10045"}},
  {restaurant_id:4, name:"SushiBar", town:"Tokyo", cuisine:"Japanese", score:7, address:{zipcode:"10123"}}
])

db.restaurant.find()

db.restaurant.find().sort({name:-1})

db.restaurant.find(
  {score:{$lte:10}},
  {restaurant_id:1, name:1, town:1, cuisine:1}
)

db.restaurant.aggregate([
  {$group:{_id:"$name", avgScore:{$avg:"$score"}}}
])

db.restaurant.find(
  {"address.zipcode":/^10/},
  {name:1, address:1}
)
