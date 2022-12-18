const { expect } = require("chai");
import { ethers } from "hardhat";

describe("Token contract", function () {
  let contract: any;

  before("Deploy Contract", async () => {
    const Gembox = await ethers.getContractFactory("GemboxDAO");
    contract = await Gembox.deploy("GEMBOX");

    await contract.deployed();
  });

  it("Should Create Pool", async function () {
    const [owner] = await ethers.getSigners();
    const response = await contract.createPool(owner.address, 10, 1220000, 100);
    const activePools = await contract.getActivePoolList();
    console.log(activePools);
  });
});
