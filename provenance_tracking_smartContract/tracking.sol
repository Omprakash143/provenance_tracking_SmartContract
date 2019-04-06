pragma solidity ^0.4.25;



/*	test cases 1. check whether the product received in given time. if not possibility that product may damage.

test case 2. check whether the stages are updated in provided correct order.

test case 3. provide product delay time and message.
		*/

contract TrackingSystem{


	// stages(intermediaries) the product pass through.
	
	enum productStages { source , pos1 , pos2 , pos3 , consume }

	// variable to refer productStages.
 		
productStages public productAt;	
							

	
	uint public currentTime;


	
	string public message;


	
	uint public delay;



	// store the address of owner who create the instane of smart contract.

		address public owner; 	

	// mapping to check the correct owner at the stage the product passing through.
		mapping( bytes32 => address ) stageOwner; 	 

     	//constructor , an instance of TrackingSystem smart contract called when contract instance is created.
		constructor(address ad1 , address ad2 , address ad3){	
		
		// contract creator is the owner of the product.
			owner = msg.sender;   

 		// store the current time.					
	
		currentTime = now;


		// store that product is verified by owner and moving towards pos1, store the product source stage.
			productAt = productStages.source;

		// storing owner address so that he can't update the stage(productAt) status at other stages.									
			stageOwner[sha3(productStages.source)] = msg.sender;


		// stages(intermediaries)owner addresses from where the product pass through.
			stageOwner[sha3(productStages.pos1)] = ad1;

			stageOwner[sha3(productStages.pos2)] = ad2;

			stageOwner[sha3(productStages.pos3)] = ad3;

		  
		}// end of constructor.





/*
	Below shows the stage and respective stage owner only who can call the contract to update the stage variable.
*/

 


// function to update product stages.



	function updateProductStage() public{



	//check product is moved from source to pos1.
		if(productAt==productStages.source){

		// if moved , check whether the pos1 owner is updating the status or not.
			if(msg.sender==stageOwner[sha3(productStages.pos1)]){


			// check whether the product reached pos1 from owner in specified time say: 10 seconds here (useful if time get delayed product may damage).
			// if delayed.
			    if(now > currentTime+10 seconds){

			        delay = now - currentTime +10 seconds;
                              	message = "product delayed to pos1, please check the delay ";
       			        productAt = productStages.pos1;
                            }else{
			// if not delayed.
			        delay = 0;

				productAt = productStages.pos1;

			    }

			    currentTime = now;

			}

		}


	//check product is moved from pos1 to pos2.
		if(productAt==productStages.pos1){


		// if moved , check whether the pos2 owner is updating the status or not.
			if(msg.sender==stageOwner[sha3(productStages.pos2)]){


			// check whether the product reached pos2 from pos1 in specified time say: 10 seconds here (useful if time get delayed product may damage).
			// if delayed.
			    if(now > currentTime+10 seconds){

			        delay = now - currentTime +10 seconds;

			        message = "product delayed to pos2, please check the delay ";

			        productAt = productStages.pos2;

			    }else{

			// if not delayed.
			        delay = 0;

				productAt = productStages.pos2;

			    }

			    currentTime = now;

			}

		}
	

	//check product is moved from pos2 to pos3.	
		if(productAt==productStages.pos2){


		// if moved , check whether the pos3 owner is updating the status or not.
			if(msg.sender==stageOwner[sha3(productStages.pos3)]){


			// check whether the product reached pos3 from pos2 in specified time say: 10 seconds here (useful if time get delayed product may damage).
			    if(now > currentTime+10 seconds){

			        delay = now - currentTime +10 seconds;

			        message = "product delayed to pos3, please check the delay ";

			        productAt = productStages.pos3;

			    }else{
			// if not delayed.
			        delay = 0;

				productAt = productStages.pos3;

			    }

			    currentTime = now;

			}

		}

	}// end of updateProductStage method.




}
// end of contract.