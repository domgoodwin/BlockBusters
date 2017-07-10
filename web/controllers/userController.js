var user = require('../models/user');

// Display Author create form on GET
exports.user_create_get = function(req, res) {
    res.render('user_registration', { title: 'Create User' });
};

// Display Author create form on GET
exports.user_login_get = function(req, res) {
    res.render('login', { title: 'Login' });
};

// Handle Author create on POST
exports.user_create_post = function(req, res) {
    res.send('NOT IMPLEMENTED: User create POST');
};
// Handle Author login on POST
exports.user_login_post = function(req, res) {
    res.send('NOT IMPLEMENTED: Login POST');
};
