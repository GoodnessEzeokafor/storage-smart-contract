// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;




contract SimpleStorage{
    // initialize favourite number
    uint256 favouriteNumber;
    // initilize a boolean
    bool favouriteBool = true;
    // initializ favourite string
    string favouriteString = "string";
    int256 favouriteInt = -5;
    address wallet1= 0x0e61D94d3E1141d341D1111997a79CE619730A0f;
    bytes favouriteBytes = "cat";

    // People struct
    struct People{
        uint256 favouriteNumber;
        string name;
    }
        People[]public people;
        mapping(string => uint256) public nameToFavouriteNumber;

    //People public person = People({favouriteNumber:0, name:"Goodness"});
    
        function storeFavouriteNumber(uint256 _favouriteNumber)public{  
            favouriteNumber = _favouriteNumber;
        }
        
        function getFavouriteNumber()public view returns(uint256){
            return favouriteNumber;
        }
        
        function addPerson(string memory _name, uint256 _favouriteNumber) public{
            people.push(People({name:_name,favouriteNumber:_favouriteNumber }));
            nameToFavouriteNumber[_name] = _favouriteNumber;
        }
        
    
    
}
