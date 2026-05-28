const { ethers } = require("hardhat");

async function main() {
    const Token = await ethers.getContractFactory("LabToken");
    const token = await Token.deploy();
    await token.waitForDeployment();
    console.log("LabToken deployed to:", await token.getAddress());
}

main().catch((err) => { console.error(err); process.exit(1); });
