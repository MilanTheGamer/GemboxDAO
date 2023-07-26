const { expect } = require("chai");
import { ethers } from "hardhat";

const {
  VRF_COORDINATOR,
  CHAINLINK_SUBSCRIPTION_ID,
  GAS_PRICE_KEYHASH,
  CALLBACK_GAS_LIMIT,
  VRF_REQUEST_CONFIRMATION,
} = process.env;

describe("RandomNumberConsumer TEST", function () {
  let contract: any;
  let subscriptionId: number = Number(CHAINLINK_SUBSCRIPTION_ID);
  let vrfCoordinator: string = `${VRF_COORDINATOR}`;

  before("Deploy Contract", async () => {
    const RNC = await ethers.getContractFactory("RandomNumberConsumer");
    contract = await RNC.deploy(subscriptionId, vrfCoordinator);

    await contract.deployed();
  });

  it("Should Create Pool", async function () {
    const [owner] = await ethers.getSigners();
    const response = await contract.getRandomNumber();
  });
});
