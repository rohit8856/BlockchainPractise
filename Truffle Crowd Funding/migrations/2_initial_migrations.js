const todo = artifacts.require("todolist");

module.exports = function (deployer) {
  deployer.deploy(todo);
};
