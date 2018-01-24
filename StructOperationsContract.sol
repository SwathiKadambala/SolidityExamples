pragma solidity ^0.4.17;

/********
 * This contract shows the various operations performed on user defined struct which has simple mapping  
 * 
 *********/
contract StructOperations{
    
    // user-defined struct 
    
    struct InsurancePolicy {
        
        mapping(uint => bool) premiumDetails;   // A mapping which stores premium no and is paid or not    
    }
    
    // Declaration of struct 
    InsurancePolicy policy; 
    
    // insert opertion 
    
    function insert(uint premiumNo) public {
        
        policy.premiumDetails[premiumNo] = true;
        
    }
    
    // remove opertion 
    
    function remove(uint premiumNo) public{
        
        if(policy.premiumDetails[premiumNo] == false){
            return; 
        }
        policy.premiumDetails[premiumNo] = false; 
        
    }
    
   // Check Contains
   
   function contain(uint premiumNo) view public returns(bool) {
       
       if(policy.premiumDetails[premiumNo]){
           return true;
       }
       return false; 
   }
   
    
}