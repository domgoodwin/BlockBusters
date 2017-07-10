var db = require("./dydbInterface.js");

var address = {line1: "line1", line2: "line2", postcode:"aa11 1aa"}
//db.InsertUser("1", "key", "pass", "test", address);
//db.GetUser(0);
//
// db.GetNextUserID(function(maxID){
//   console.log(maxID);
// })

db.Login("1", "pass");
