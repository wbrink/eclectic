const router = require("express").Router();
const pool = require("../db");


router.get("/", (req, res) => {
  res.json({msg: "hello world"});
})

router.post("/api/user/login", (req,res) => {
  // if successful login
  // after succesfully checking that the user exists
  // req.session.userID = user.user_id
  res.json({msg:"login Route Hit"})
})