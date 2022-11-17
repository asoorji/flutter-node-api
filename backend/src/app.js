var express = require('express'); 
var app = express();
var morgan = require('morgan'); 
var cors = require('cors'); 

app.use(morgan('dev'));
app.use(cors());

app.use(require('./routes/users'));

module.exports = app