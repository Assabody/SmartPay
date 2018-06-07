pragma solidity ^0.4.17;

contract SmartPay {

	struct WithdrawlStruct {
	    address from;
		address to;
		uint amount;
	}

	// event for deposit and for withdraw
	event Deposit(address _sender, uint amount);
	event Withdraw(address _sender, uint amount, address _beneficiary);

	function() {
		Deposit(msg.sender, msg.value);
	}
    
	function sendFunds(uint amount, address receiver) returns (uint) {
		if(this.balance >= amount) {
			if(!receiver.send(amount)) {
				throw;
			}
			Withdraw(msg.sender, amount, receiver);
			return this.balance;
		}
	}
}
