// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
contract BuyMeACofee{
   
   //event

   event NewMemo(
      address indexed from,
      uint256 timestamp,
      string name,
      string message
   );

   struct Memo{
      address from;
      uint256 timestamp;
      string name;
      string message;
   }
   //memos list
   Memo[] memos;


   //owner address
   address payable owner;

   //withdraw address
   address payable depositAddress;


   constructor(){
      owner=payable(msg.sender);
      depositAddress=payable(msg.sender);
   }

   function modifyDepositAddress(address payable _address) public{
      require(msg.sender==owner,"You cannot do this");
      depositAddress=_address;
   }

   function buyCofee( string memory _name,string memory _message) public payable  {
      require(msg.value>0,"can't buy coffee with 0 eth");
      
      memos.push(Memo(msg.sender,block.timestamp,_name,_message));

      //emit an log event
      emit NewMemo(msg.sender,block.timestamp,_name,_message);
   }

   function withdrawTips()public{
      require(depositAddress.send( address(this).balance));
   }

   function getMemos() view public returns(Memo[]memory){
      return memos;
   }
   
}
