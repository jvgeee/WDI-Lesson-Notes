var express = require('express');
var app     = express();
var port    = process.env.PORT || 3000;

app.set('views', './views');
app.set('view engine', 'ejs');

app.use(express.static(__dirname + '/public'));

app.get('/', function(req, res) {
  // res.send("Hello World");
  res.render('index');
});

app.listen(port);
console.log("Server started on port "  + port);