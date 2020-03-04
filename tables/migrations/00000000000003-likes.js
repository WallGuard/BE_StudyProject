const path = require('path');
const boilerplate = require('db-migrate-boilerplate');

module.exports = boilerplate ({
  upPath: path.join(__dirname, 'sqls', 'table_Likes-up.sql'),
  downPath: path.join(__dirname, 'sqls', 'table_Likes-down.sql'),
})
