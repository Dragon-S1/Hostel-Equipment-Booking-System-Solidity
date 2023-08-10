// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Booking{
    address public owner;   //owner of the contract
    uint _tokenId;          //token id counter 
    uint public supply;     //total number of tokens
    mapping(uint => address) owners;    //mapping of tokens ids with addresses
    mapping(address => uint) balances;  //mapping of addresses with number of tokens owned
    mapping(address => uint) accepts;   //mapping of addresses with accepting token id
    mapping(uint => string) URIs;       //mapping of token id with their URI

    constructor(){
        owner = msg.sender;             //set the owner as the one who deploy contract
        _tokenId = 1;                   //start token id with 1
        supply = 0;                     //set initial supply as 0
    }

    modifier onlyOwner() {              //modifier to check if the user is owner
        require(msg.sender == owner,"Only owner can call this");
        _;
    }

    modifier tokenExist(uint tokenId) { //modifier to check if the token is minted
        require(tokenId < _tokenId && tokenId > 0, "Token doesn't exist");
        _;
    }

    modifier tokenOwn(uint tokenId) { //modifier to check if the user owns the token
        require(owners[tokenId] == msg.sender, "You dont own the token");
        _;
    }

    function mint(string memory URI) public onlyOwner{  //token minting function
        owners[_tokenId] = owner;                       //Give the token to the owner
        URIs[_tokenId] = URI;                           //set URI
        balances[owner]++;                              //increase balance
        _tokenId++;                                     //increment token id counter
        supply++;                                       //increment in supply
    }

    function balance(address addr) public view returns (uint, uint[] memory){   //check balance of the given address
        uint _balance = balances[addr];                 //balance of the address
        uint[] memory tokens =  new uint[](_balance);   //array to store ids of all the owned tokens
        uint j=0;
        for(uint i=1; i<_tokenId; i++){                  //check which tokens are owned and add id in array
            if(owners[i]==addr){
                tokens[j] = i;
                j++;
            }
        }
        return (_balance,tokens);                       //return total balance and all token ids
    }

    function tokenURI(uint tokenId) public view returns (string memory){    //return URI of token
        return URIs[tokenId];
    }

    function accepting(address addr) public view returns (uint){            //return which token an address is accepting
        return accepts[addr];
    }

    function tokenOwner(uint tokenId) public view returns (address){        //return onwer address of the token
        return owners[tokenId];
    }

    function transfer(address to, uint tokenId) public tokenOwn(tokenId){   //transfer the token to other address
        require(accepts[to] == tokenId, "Receiver doesn't accept");         //check if the receiver is accepting the token
        owners[tokenId] = to;       //set owner to the receiver address
        balances[to]++;             //increase balance of receiver
        balances[msg.sender]--;     //decrease balance of sender
        accepts[to] = 0;            //set accpeting to 0 of the receiver
    }

    function burn(uint tokenId) public onlyOwner tokenExist(tokenId) tokenOwn(tokenId){ //burn the token
        owners[tokenId] = address(0);   //reset the owner address
        balances[msg.sender]--;         //decrease the balance
        supply--;                       //decrease supply
        URIs[tokenId] = "";             //reset URI
    }

    function accept(uint tokenId) public tokenExist(tokenId) {  //
        require(owners[tokenId] != msg.sender, "You already own the token");
        accepts[msg.sender] = tokenId;
    }

    function unaccept() public{     //reset the accepting token id
        accepts[msg.sender] = 0;
    }

    function isAvailable(uint tokenId) public tokenExist(tokenId) view returns(bool){   //check if the token is available with the owner
        return owners[tokenId] == owner;
    }
}