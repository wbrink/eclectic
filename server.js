require("dotenv").config();
const express = require('express');
const app = express();


// setup express-session middleware
const session = require("express-session");

app.use(session({
  resave: false,
  saveUninitialized: false,
  secret: process.env.SESSION_SECRET
}))


app.use(require("./auth/loadUser"));
app.use(require("./api/user"))



app.listen("Server is running on Port", process.env.PORT);

