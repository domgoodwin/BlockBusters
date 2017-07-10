var express = require('express');
var router = express.Router();

// Require controller modules
var user_controller = require('../controllers/userController');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

/* GET request for creating a user.*/
router.get('/create', user_controller.user_create_get);

/* POST request for creating user. */
router.post('/create', user_controller.user_create_post);

module.exports = router;
