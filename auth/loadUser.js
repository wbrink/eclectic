const { load } = require("dotenv/types");
const pool = require("../db");

// req.session middleware will look for connect.sid cookie that is present and load the data that is saved in the session store that matches the cookies unsigned signature
// in our case in api_routes we save the userID to the session store and use this middleware to load the user into the req object if the user is still logged in
function loadUser(req,res,next) {
  if (req.session.userID) {
    let sql = "SELECT * FROM users WHERE user_id = ?";
    pool.query(sql, [req.session.userID], (error, results) => {
      if (error) throw error;
      if (results[0]) {
        let user = results[0]; // checking if empty;
        req.user = {username: user.username, user_id: user.user_id}
        next();
      } else {
        next()
      }
    })
  } else {
    next();
  }
}

module.exports = loadUser;