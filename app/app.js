const express = require('express');
const exphbs  = require('express-handlebars');
const path = require('path');

const app = express();

const hbsConfig = exphbs.create({
  layoutsDir: path.join(__dirname, 'views/layouts/'),
  defaultLayout: 'main',
  extname: '.hbs',
});

app.engine('.hbs', hbsConfig.engine);

app.set('view engine', '.hbs');
app.set('views', path.join(__dirname, 'views'));

app.use(express.static(path.join(__dirname, 'static')));

app.get('/', (req, res) => {
  res.render('home', { home: true });
});
app.get('/features', (req, res) => {
  res.render('features', { features: true });
});
app.get('/news', (req, res) => {
  res.render('news', { news: true });
});


module.exports = app;
