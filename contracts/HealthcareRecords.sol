// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract HealthcareRecords {
    address owner;
     
     struct Record {
        uint256 recordID;
        string patientName;
        string diagnosis; //what is the problem with patien
        string treatment;
        uint256 timestamp;
     }

     mapping(uint256 => Record[]) private patientRecords;

     mapping(address => bool) private authorizedProviders;

     modifier onlyOwner(){
      require(msg.sender == owner, "Only owner can perform this function");
      _;
     }

     modifier onlyAuthorizedProvider() {
      require(authorizedProviders[msg.sender], "Not Authorized");
      _;
     }

     constructor(){
        owner = msg.sender;
     }

     function getOwner() public view returns(address){
        return owner;
     }

     function authorizeProvider(address provider) public onlyOwner{
      authorizedProviders[provider] = true;
     }

     function addRecord(uint256 patienId, string memory patientName, string memory diagnosis, string memory treatment) public onlyAuthorizedProvider{
       uint256 recordID = patientRecords[patienId].length + 1 ;
       
       patientRecords[patienId].push(Record(recordID, patientName, diagnosis, treatment, block.timestamp));
      }

      function getPatienRecords(uint256 patienID) public view onlyAuthorizedProvider returns(Record[] memory){
         return patientRecords[patienID];
      }
       


}
