const path = require('path');
const boilerplate = require('db-migrate-boilerplate');

module.exports = boilerplate ({
  upPath: path.join(__dirname, 'sqls', 'trigger-LikesCount-up.sql'),
  downPath: path.join(__dirname, 'sqls', 'trigger-LikesCount-down.sql'),
})
