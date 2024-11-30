const { ethers } = require("hardhat");

async function main() {
    const HealthCare = await ethers.getContractFactory("HealthcareRecords");
    const healthCare = await HealthCare.deploy();
    //await healthCare.deployed();
    //console.log("hea; deployed to:", healthCare.address);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});