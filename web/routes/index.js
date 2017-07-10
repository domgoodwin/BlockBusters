var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.redirect('/blockbusters');
});

/* GET request for creating a user */
router.get('/createUser', genre_controller.genre_create_get);

/* POST request for creating user. */
router.post('/createUser', genre_controller.genre_create_post);

module.exports = router;
