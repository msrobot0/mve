//SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

//import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract MVE is ERC20 {

    constructor() ERC20("MinimumViable", "MVE") public {
        _mint(msg.sender, 1000000 * 10 ** 18);
    }

}
