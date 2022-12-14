import { ethers } from "hardhat";

async function main() {
  const Gembox = await ethers.getContractFactory("GemboxDAO");
  const gembox = await Gembox.deploy("GEMBOX");

  await gembox.deployed();

  console.log(`Deployed to ${gembox.address}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
