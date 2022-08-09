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


   constructor(){
      owner=payable(msg.sender);
   }

   function buyCofee( string memory _name,string memory _message) public payable  {
      require(msg.value>0,"can't buy coffee with 0 eth");
      
      memos.push(Memo(msg.sender,block.timestamp,_name,_message));

      //emit an log event
      emit NewMemo(msg.sender,block.timestamp,_name,_message);
   }

   function withdrawTips()public{
      require(owner.send( address(this).balance));
   }

   function getMemos() view public returns(Memo[]memory){
      return memos;
   }
   
}
