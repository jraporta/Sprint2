db.restaurants.find()
db.restaurants.find({},{name: 1, borough: 1, cuisine: 1})
db.restaurants.find({},{_id: 0, name: 1, borough: 1, cuisine: 1})
db.restaurants.find({},{_id: 0, name: 1, borough: 1, "address.zipcode": 1})
db.restaurants.find({borough: "Bronx"})
db.restaurants.find({borough: "Bronx"}).limit(5)
db.restaurants.find({borough: "Bronx"}).skip(5).limit(5)
db.restaurants.aggregate([{$unwind: "$grades"}, {$group:{_id: "$_id", score:{$sum: "$grades.score"}}}, {$match: {score: {$gte: 90}}}])
db.restaurants.aggregate([{$unwind: "$grades"}, {$group:{_id: "$_id", score:{$sum: "$grades.score"}}}, {$match: {score: {$gt: 80, $lt: 100}}}])
db.restaurants.aggregate([{$match: {"address.coord.1": {$lt: -95.754168}}}])
db.restaurants.aggregate([{$match: {$and: [{cuisine: {$ne: "American "}}, {"address.coord.0": {$lt: -65.754168}}]}}, {$unwind: "$grades"}, {$group:{_id: {id: "$_id", cuisine: "$cuisine", coord: "$address.coord"}, score:{$sum: "$grades.score"}}}, {$match: {score: {$gt: 70}}}])
db.restaurants.find({cuisine: {$ne: "American "}, "address.coord.0": {$lt: -65.754168}, "grades.score": {$gt: 70}})
db.restaurants.find({cuisine: {$ne: "American "}, "grades.grade": "A", borough: {$ne: "Brooklyn"}}).sort({cuisine: -1})
db.restaurants.find({name: {$regex: "^Wil"}}, {_id:0, restaurant_id:1, name:1, borough:1, cuisine:1})
db.restaurants.find({name: /ces$/}, {_id:0, restaurant_id:1, name:1, borough:1, cuisine:1})
db.restaurants.find({name: /Reg/}, {restaurant_id: 1, name: 1, borough: 1, cuisine:1, _id: 0})
db.restaurants.find({borough: "Bronx", cuisine: {$in: ["American ", "Chinese"]}})
db.restaurants.find({borough: {$in: ["Staten Island", "Queens", "Bronx", "Brooklyn"]}}, {restaurant_id: 1, name:1, borough: 1, cuisine: 1, _id: 0})
db.restaurants.find({borough: {$nin: {"Staten Island", "Queens", "Bronx", "Brooklyn"]}},{restaurant_id:1, name: 1, borough: 1, cuisine: 1, _id: 0})
db.restaurants.find({"grades.score": {$lte: 10}},{restaurant_id:1, name: 1, borough: 1, cuisine: 1, _id: 0})
db.restaurants.find({$or: [{name: /^Wil/}, {cuisine: "Seafood"}]}, {restaurant_id: 1, name: 1, borough: 1, cuisine: 1, _id: 0})
db.restaurants.find({grades: {$elemMatch: {grade: "A", score: 11, date: ISODate("2014-08-11T00:00:00Z")}}}, {restaurant_id: 1, name: 1, grades:1, _id: 0})
db.restaurants.find({"grades.1.date": ISODate("2014-08-11T00:00:00Z"), "grades.1.grade": "A", "grades.1.score": 9}, {restaurant_id: 1, name: 1, grades:1, _id: 0})
db.restaurants.find({"address.coord.1": {$gt: 42, $lte: 52}}, {restaurant_id: 1, name: 1, address: 1, coord: "$address.coord", _id: 0})
db.restaurants.find().sort({name: 1})
db.restaurants.find().sort({name: -1})
db.restaurants.find().sort({cuisine: 1, borough: -1})
db.restaurants.find({"address.street": {$exists: false}})
db.restaurants.find({"address.coord": {$type: "double"}})
db.restaurants.find({grades: {$elemMatch: {score: {$mod: [7, 0]}}}}, {restaurant_id: 1, name: 1, score: "$grades.score", _id: 0})
db.restaurants.find({name: /mon/}, {name: 1, borough: 1, longitude: {$arrayElemAt: ["$address.coord", 0]}, latitude: {$arrayElemAt: ["$address.coord", 1]}, cuisine: 1, _id: 0})
db.restaurants.find({name: /^Mad/}, {name: 1, borough: 1, longitude: {$arrayElemAt: ["$address.coord", 0]}, latitude: {$arrayElemAt: ["$address.coord", 1]}, cuisine: 1, _id: 0})