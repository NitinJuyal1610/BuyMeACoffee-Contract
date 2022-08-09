require("@nomicfoundation/hardhat-toolbox");
require("@nomiclabs/hardhat-ethers");
require("dotenv").config();
/** @type import('hardhat/config').HardhatUserConfig */
const ALCHEMY_URL = process.env.ALCHEMY_URL;
const PRIVATE_KEY = process.env.PRIVATE_KEY;

module.exports = {
  solidity: "0.8.9",
  networks: {
    polygon: {
      url: ALCHEMY_URL,
      accounts: [PRIVATE_KEY],
    },
  },
};
