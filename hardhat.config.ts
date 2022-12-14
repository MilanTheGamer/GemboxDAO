import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import "@nomiclabs/hardhat-etherscan";
import dotenv from "dotenv";

dotenv.config();

const { PRIVATE_KEY, RPC_PROVIDER_HTTPS, POLYGON_SCAN_API_KEY } = process.env;

const config: HardhatUserConfig = {
  solidity: {
    version: "0.8.17",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
    },
  },
  networks: {
    hardhat: {},
    mumbai: {
      url: RPC_PROVIDER_HTTPS,
      accounts: [`${PRIVATE_KEY}`],
    },
  },
  etherscan: {
    apiKey: POLYGON_SCAN_API_KEY,
  },
};

export default config;
