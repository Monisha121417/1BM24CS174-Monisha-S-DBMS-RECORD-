use customerdb

db.customers.insertMany([
  {Cust_id:1, Acc_Bal:500, Acc_Type:"Z"},
  {Cust_id:1, Acc_Bal:800, Acc_Type:"Z"},
  {Cust_id:2, Acc_Bal:300, Acc_Type:"A"},
  {Cust_id:2, Acc_Bal:1000, Acc_Type:"Z"},
  {Cust_id:3, Acc_Bal:700, Acc_Type:"Z"}
])

db.customers.aggregate([
  {$match:{Acc_Type:"Z"}},
  {$group:{_id:"$Cust_id", total:{$sum:"$Acc_Bal"}}},
  {$match:{total:{$gt:1200}}}
])

db.customers.aggregate([
  {$group:{_id:"$Cust_id", min:{$min:"$Acc_Bal"}, max:{$max:"$Acc_Bal"}}}
])

// Export (run in system terminal, not inside Mongo shell)
mongoexport --db customerdb --collection customers --out customers.json

db.customers.drop()

// Import (run in system terminal)
mongoimport --db customerdb --collection customers --file customers.csv --type csv --headerline
