pragma solidity 0.8.0;

contract Auction{
    
    
    
    mapping( address => Seller) public Producer;
    mapping(address => User) public user;
    mapping(uint => Seller) public unique;
    
    
    
    uint256 idcount = 1;
    struct Seller {
        uint id;
        address payable Seller_address;
        string name;
    }
    struct Artwork {
        
        string specs;
        uint price;
        uint sellerid;
        
    }
    struct User {
        string name;
        address UserAddress;
    }
    
    
    function Seller_creation(string memory name, address payable accAddress) public {
        Seller memory seller = Seller(idcount, accAddress , name );
        Producer[accAddress] = seller;
        unique[idcount] = seller;
        idcount++;
    }
    function auction( string memory specs,uint sellerid,uint price) public {
        Artwork memory artwork = Artwork(specs,price,sellerid);
    }
}