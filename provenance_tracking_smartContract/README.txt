Smart contract name is : TrackingSystem.

1. The smart contract can track the assets from source(manufacturer) to destination(consumer) throught which intermidiaries the product passes.
2. Smart contract can track the product ownership.
3. It can track the position of the product i.e, right now where the product is using productAt(refer code).
4. It can make sure that the product is reached to next stages in given time and can display a message if the product gets delayed at any stage and the amount of time the product delayed.
5. Allow only right owner at right position to call the updateStages() method to update the stage(productAt).
6. Make sure status is updated as per given owner(address) order i.e, pos2 owner cannot update the stage(productAt) before reaching the product to pos1 owner.


TEST CASES:
	1. Check whether the product received in given time. if not, possibility that the product may damage.

	REASON: Assume if the product is vegetables. If they get delayed at intermediaries there may chance of damage. So the consumer can undo purchasing them.

	2. Check whether the stages are updated in provided correct order.
	REASON: If not, the overall aim of this contract is useless. chances that some may pretend this product owner is X but they bought the product from Y.

	3. Provide product delay time and message.
	REASON: As time is important, upto how much time the product is safe can be decided by the consumer before buying the product.

	4. Only intermediary owner's allowed to invoke the updateStage() method.
	REASON: To make sure the integrity of the product i.e, to make sure that the product is not modified and to find any fault easily.
