require("@nomicfoundation/hardhat-toolbox");
//require('@nomiclabs/hardhat-waffle');
require("dotenv").config({ path: ".env" });
ALCHEMY_API_KEY_URL="https://eth-goerli.g.alchemy.com/v2/DIRxbLwNSbUFsxkT3Z3ES-uBQR5XTnoY"

/** @type import('hardhat/config').HardhatUserConfig */

module.exports = {
  defaultNetwork: "goerli",
  networks: {
    hardhat: {
    },
    goerli: {
      url: ALCHEMY_API_KEY_URL,
      accounts: ["0x" + process.env.GOERLI_PRIVATE_KEY]
    }
  },

  solidity: '0.8.1',

};