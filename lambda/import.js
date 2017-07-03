var db = require("./dydbInterface.js");

var address = {line1: "line1", line2: "line2", postcode:"aa11 1aa"}
db.InsertUser("0", "key", "pass", "test", address);
