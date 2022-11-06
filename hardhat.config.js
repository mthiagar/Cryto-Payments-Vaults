require("@nomicfoundation/hardhat-toolbox");
//require('@nomiclabs/hardhat-waffle');
require("dotenv").config({ path: ".env" });

/** @type import('hardhat/config').HardhatUserConfig */

module.exports = {
  defaultNetwork: "mumbai",
  networks: {
    hardhat: {
    },
    mumbai: {
      url: process.env.ALCHEMY_API_KEY_URL,
      accounts: ["0x" + process.env.MUMBAI_PRIVATE_KEY]
    }
  },

  solidity: '0.8.1',

};