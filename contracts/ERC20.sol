//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract ERC20 {
  uint256 public totalSupply;
  string public name;
  string public symbol;

  mapping(address => uint256) public balanceOf;


  constructor (string memory _name, string memory _symbol) {
    name = _name;
    symbol = _symbol;
  }

  function decimals() public pure returns (uint8){
    return 18;
  }
  function transfer(address recipient, uint256 amount) external returns (bool) {
    require(recipient != address(0), "ERC20: transfer to the zero address");
    uint256 senderBlanace = balanceOf[msg.sender];

    require(senderBlanace >= amount, "ERC20: transfer amount exceeds balance");

    balanceOf[msg.sender] = senderBlanace - amount;

    balanceOf[recipient] = balanceOf[recipient] + amount;

    return true;

  }
}
