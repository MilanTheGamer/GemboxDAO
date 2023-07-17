const { expect } = require("chai");
import { ethers } from "hardhat";

describe("GemBox contract", function () {
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
  });

  it("Should Join a Pool", async function () {
    const [owner] = await ethers.getSigners();
    const activePools = await contract.getActivePoolList();
    const poolId = activePools[0];
    await contract.joinPool(poolId);
    await contract.joinPool(poolId);
    const poolTickets = await contract.getUserTickets(owner.address);
    console.log(poolTickets);
    // const contractResponse = await response.wait();
    // console.log({ contractResponse, activePools });
  });
});
