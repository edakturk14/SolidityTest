Contract: buildigng block for solditiy 

pragma solidity >=0.5.0 <0.6.0;// add the verison fort he complier

// contract is the building block for solidity 
contract ZombieFactory {


    // events: communicate what has happened to the front end 
    // your front end listens to these events 
    // fire these events with emit 
    event NewZombie(uint zombieId, string name, uint dna); 

    //state var are stored permamently 
    // uint: non-signed integer (positive int), it refers to unit256- you also have uit8, uint16 etc.
    uint dnaDigits = 16;


    // math opeations in solidity - same as many languages 
    // exponential operator: x = 5 ** 2 (5^2)
    uint dnaModulus = 10 ** dnaDigits;


    // structs: complex data types (like classes)
    struct Zombie{
        string name;
        uint dna;
    }

    // data types: arrays
    // fixed arrays:
    //      uint arrays: uint[x] myArray; --> has a fixed size of x 
    //      string arrays: string[5] myArray
    // dynamic arrays: 
    //      uint[] --> don't define the size 
    // array of structs:
    //      Zombie[] myArray;
    // public array: other contracts can read from it, solidity will automatically 
    // create  a getter for it 
    // Zombie[] public zombies;

    Zombie[] public zombies;

    // functions: public 
    function _createZombie(string memory _name, uint _dna) private {
        uint id = zombies.push(Zombie(_name, _dna)) - 1;  
        emit NewZombie(id, _name, _dna); // fires the event
    }


    // functions are public by default 
    // you can add the private keyword to make it private 
    // the naming convetion is usually to start the func name with: _
    function _createZombiePrivate(string memory _name, uint _dna) private {
        zombies.push(Zombie(_name, _dna));
        emit NewZombie(zombies.push-1, _name, dna); // fires the event

    

    // functions have the return value type in the def
    // view: if the state doesn't change (eg: just for a static return)
    // pure: if you are not accessing any data on the app 

    // random number: keccak256 is built in hash func of ethereum 
    // keccak256(abi.encodePacked("xxyy"))
    // typecasting: types are important, make sure the parameters are the same type if 
    // you want to make an operation 

    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus ;
    }


    function createRandomZombie(string memory _name) public{
       uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }



}








