require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

/** @type import('hardhat/config').HardhatUserConfig */

const {SECRET_KEY, SEPOLIA_URL} = process.env;

module.exports = {
  solidity: "0.8.27",
  networks:{
    sepolia:{
      url:SEPOLIA_URL,
      accounts:[SECRET_KEY]
    }
  }

};