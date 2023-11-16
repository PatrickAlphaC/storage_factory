// SPDX-License_Identifier : MIT

// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

import "./simpleStorage.sol" ; //as we want to create a contract which creates a simple storgae contracts.

contract StorageFactory is SimpleStorage{            // Inheritance we inherited simple storage to Storagefactory.

    SimpleStorage[] public SimpleStorageContractarray; // to store all the new creating contracts.


    function CreateSimpleStorageContract() public {

        // here we are create new objects of SimpleStorage contract which takes no arguments.
        SimpleStorage SimpleStorageNewContract = new SimpleStorage();
        SimpleStorageContractarray.push(SimpleStorageNewContract);
    }

    // now we need to interact with the contracts we are creating.
    // fornthis we need the address of the contract we want to interact with .
    // we also need ABI which we get from the import file.

    function sfStore(uint256 contractIndex , uint256 contractNumber) public {
        // here we need contractIndex to get the index at which our contract addess is present.
        // and contractNumber to pass the fovorie number on simple storage file.

       SimpleStorage SimpleStorage = SimpleStorage(address(SimpleStorageContractarray[contractIndex])); // here we are retriving the address and interact with simple storage contact.
       SimpleStorage.store(contractNumber);
    
    } 

    function sfGet(uint contractIndex)  public view returns(uint256) {
        return SimpleStorage(address(SimpleStorageContractarray[contractIndex])).retrieve();
    }



}

