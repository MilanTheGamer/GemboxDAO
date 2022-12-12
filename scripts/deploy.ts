import { ethers } from "hardhat";

async function main() {
  const Lock = await ethers.getContractFactory("GemboxDAO");
  const lock = await Lock.deploy("GEMBOX");

  await lock.deployed();

  console.log(`Deployed to ${lock.address}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});