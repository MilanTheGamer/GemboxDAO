import { ethers } from "hardhat";

const {
  VRF_COORDINATOR,
  CHAINLINK_SUBSCRIPTION_ID,
  GAS_PRICE_KEYHASH,
  CALLBACK_GAS_LIMIT,
  VRF_REQUEST_CONFIRMATION,
} = process.env;

async function main() {
  const Gembox = await ethers.getContractFactory("GemboxDAO");
  const gembox = await Gembox.deploy("GEMBOX");

  const VRFContract = await ethers.getContractFactory("RandomNumberConsumer");
  const VRF = await VRFContract.(subscriptionId, vrfCoordinator);

  await gembox.deployed();

  console.log(`Deployed to ${gembox.address}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
