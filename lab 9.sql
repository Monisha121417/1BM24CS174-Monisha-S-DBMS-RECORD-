use studentdb

db.student.insertMany([
  {rollno:1, name:"Asha", email:"asha@gmail.com", dept:"CSE"},
  {rollno:2, name:"Ravi", email:"ravi@gmail.com", dept:"ISE"},
  {rollno:3, name:"Neha", email:"neha@gmail.com", dept:"CSE"},
  {rollno:10, name:"Kiran", email:"kiran@gmail.com", dept:"ECE"},
  {rollno:11, name:"ABC", email:"abc@gmail.com", dept:"ME"}
])

db.student.updateOne(
  {rollno:10},
  {$set:{email:"newmail@gmail.com"}}
)

db.student.updateOne(
  {rollno:11},
  {$set:{name:"FEM"}}
)

db.student.find()

db.student.drop()
