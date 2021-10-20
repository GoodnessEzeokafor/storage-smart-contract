// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "./SimpleStorage.sol";

contract StorageFactory{
    SimpleStorage[] public simpleStorageArray;
    function createSimpleStorageContract() public{
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }
    
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber)public{
        // address of the contract you want to interact with
        // get the ABI
        // get the SimpleStorage array index
        SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageIndex]));
        // store number to the array
        simpleStorage.storeFavouriteNumber(_simpleStorageNumber);
        
    }
    
    
    function sfGet(uint256 _simpleStorageIndex)public view returns(uint256){
        // address of the contract you want to interact with
        // get the ABI
        // get the SimpleStorage array index
        SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageIndex]));
        // store number to the array
        return simpleStorage.getFavouriteNumber();
        
    }
    
    
}