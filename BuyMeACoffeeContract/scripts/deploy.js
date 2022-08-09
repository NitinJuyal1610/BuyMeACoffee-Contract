const hre = require("hardhat");

async function main() {
  const BuyMeACofee = await hre.ethers.getContractFactory("BuyMeACofee");
  const buymeacofee = await BuyMeACofee.deploy();

  await buymeacofee.deployed();

  console.log("contract BuyMeACofee deployed to:", buymeacofee.address);
}
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
