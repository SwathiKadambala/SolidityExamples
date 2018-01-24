pragma solidity ^0.4.17;

// Start of library 

library StructOperationsLibrary{
    
    struct Policy{
        mapping(uint => bool) premiumDetails;  
    }
    
    //Policy Policy;  // This type of declaration is possible in contract but not in library, 
    // If you try to do so, compile time error shows is:  Library cannot have non-constant state variable 
    
    // insert operation 
    function insert(Policy storage self, uint premiumNo) public {
        
        self.premiumDetails[premiumNo] = true;
    }
    
    // remove operation 

     function remove(Policy storage self, uint premiumNo) public {
        
        if(self.premiumDetails[premiumNo] == false){
            return; 
        }
        self.premiumDetails[premiumNo] = false;    
    }
    
    // Check whether give policy no exists or not 
   
   function contain(Policy storage self, uint premiumNo) view public returns(bool) {
       
       if(self.premiumDetails[premiumNo]){
           return true;
       }
       return false; 
   }
}
// End of library 

// Start of a contract 
// How to re-use the functions of a library inside a contract 

contract StructOperationsContract{
        
    StructOperationsLibrary.Policy policy;        

    function insert() public{
        
       StructOperationsLibrary.insert(policy, 101);

    }  
    
     function remove() public{
         
         StructOperationsLibrary.remove(policy, 101);
    }  
    
     function contain() view public{
        
       StructOperationsLibrary.contain(policy, 101);

    } 
}

// End of contract 

    