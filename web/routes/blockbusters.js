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

/*GET request for logging in. */
router.get('/login', user_controller.user_login_get);

/*POST request for logging in. */
router.post('/login', user_controller.user_login_post);

module.exports = router;
